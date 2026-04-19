# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=claudectl-bin
pkgver=0.31.0
pkgrel=1
pkgdesc="Auto-pilot for Claude Code — local LLM watches sessions and decides what to approve"
arch=('x86_64' 'aarch64')
url="https://github.com/mercurialsolo/claudectl"
license=('MIT')
provides=('claudectl')
conflicts=('claudectl' 'claudectl-git')
options=('!strip')
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/mercurialsolo/claudectl/v${pkgver}/LICENSE")
sha256sums=('c7335fce47998935bbe76ef2fe9dfeb0ba7b7fb8f0edec16127a0a370f6c8b80')

_base_url="https://github.com/mercurialsolo/claudectl/releases/download/v${pkgver}"

source_x86_64=("claudectl-${pkgver}-x86_64.tar.gz::${_base_url}/claudectl-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("claudectl-${pkgver}-aarch64.tar.gz::${_base_url}/claudectl-v${pkgver}-aarch64-unknown-linux-musl.tar.gz")

sha256sums_x86_64=('c66a9747cbd7490e0c7a570e7618fd0509a4f5c54a0617397d1a0e946db063a6')
sha256sums_aarch64=('7bdaea2c061cd0154aa1ba703132c4edb286e2ec463c2c9671024998267e1013')

package() {
  install -Dm755 "${srcdir}/claudectl" "${pkgdir}/usr/bin/claudectl"
  install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
