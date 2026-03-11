# Maintainer: Francesc Elpeix
pkgname=rivulet-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="A terminal RSS reader with 3-panel layout, categories, rich preview, and OPML support"
arch=('x86_64' 'aarch64')
url="https://github.com/elpeix/rivulet"
license=('GPL-3.0-only')
provides=('rivulet')
conflicts=('rivulet')

source_x86_64=("${url}/releases/download/v${pkgver}/rivulet-v${pkgver}-x86_64-linux-gnu.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/rivulet-v${pkgver}-aarch64-linux-gnu.tar.gz")
sha256sums_x86_64=('1ea645db5b399bb0aaa9b27782585b59b1da170e1f724776159b95c648f5f882')
sha256sums_aarch64=('5572f6af45eafe243a128c5082931c6dab853efaae243dc7c6cf0b6790d82713')

package() {
    local _target="${CARCH}-linux-gnu"
    cd "rivulet-v${pkgver}-${_target}"
    install -Dm755 "rivulet" "${pkgdir}/usr/bin/rivulet"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
