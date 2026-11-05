# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=claudectl-bin
pkgver=0.92.4
pkgrel=1
pkgdesc="Auto-pilot for Claude Code — local LLM watches sessions and decides what to approve"
arch=('x86_64' 'aarch64')
url="https://github.com/mercurialsolo/claudectl"
license=('MIT')
provides=('claudectl')
conflicts=('claudectl' 'claudectl-git')
options=('!strip' '!debug')
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/mercurialsolo/claudectl/v${pkgver}/LICENSE")
sha256sums=('c7335fce47998935bbe76ef2fe9dfeb0ba7b7fb8f0edec16127a0a370f6c8b80')
sha256sums_x86_64=('79d94d9fed76f207a93e22b1ec5d55b3ae32d545f99493584a1611dda5b8c545')
sha256sums_aarch64=('cf2d7d7b049957b8878010c3790a225298806b6be04ca535c05bc2c66fdeec37')

_base_url="https://github.com/mercurialsolo/claudectl/releases/download/v${pkgver}"

source_x86_64=("claudectl-${pkgver}-x86_64.tar.gz::${_base_url}/claudectl-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("claudectl-${pkgver}-aarch64.tar.gz::${_base_url}/claudectl-v${pkgver}-aarch64-unknown-linux-musl.tar.gz")


package() {
  install -Dm755 "${srcdir}/claudectl" "${pkgdir}/usr/bin/claudectl"
  install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
