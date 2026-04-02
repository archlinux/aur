# Maintainer: Francesc Elpeix
pkgname=rivulet-bin
pkgver=1.3.1
pkgrel=1
pkgdesc="A terminal RSS reader with 3-panel layout, categories, rich preview, and OPML support"
arch=('x86_64' 'aarch64')
url="https://github.com/elpeix/rivulet"
license=('GPL-3.0-only')
provides=('rivulet')
conflicts=('rivulet')

source_x86_64=("${url}/releases/download/v${pkgver}/rivulet-v${pkgver}-x86_64-linux-gnu.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/rivulet-v${pkgver}-aarch64-linux-gnu.tar.gz")
sha256sums_x86_64=('6825e2f9deff0873df755dce8cb434f5b9334dbe5d6891d41ba42c1054c71eee')
sha256sums_aarch64=('edfa5a4d00792b62b880a01ecaeaba5fdbb86eb48dd7684d8901d20e08e25404')

package() {
    local _target="${CARCH}-linux-gnu"
    cd "rivulet-v${pkgver}-${_target}"
    install -Dm755 "rivulet" "${pkgdir}/usr/bin/rivulet"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
