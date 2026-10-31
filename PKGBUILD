# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=claudectl-bin
pkgver=0.92.3
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
sha256sums_x86_64=('f1186dc786fa1296226be66805c2d8ccc056cab5df496e42ace66b1c357c5325')
sha256sums_aarch64=('748c1d8c5bf506287ac11ef04c37a56c21e36192edb07cfd59cdaf6e418b5b47')

_base_url="https://github.com/mercurialsolo/claudectl/releases/download/v${pkgver}"

source_x86_64=("claudectl-${pkgver}-x86_64.tar.gz::${_base_url}/claudectl-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("claudectl-${pkgver}-aarch64.tar.gz::${_base_url}/claudectl-v${pkgver}-aarch64-unknown-linux-musl.tar.gz")


package() {
  install -Dm755 "${srcdir}/claudectl" "${pkgdir}/usr/bin/claudectl"
  install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
