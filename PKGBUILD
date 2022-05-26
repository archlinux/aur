# Maintainer: Renge <renge At renge.io>
pkgname=open-in-mpv
pkgver=2.0.2
pkgrel=1
pkgdesc="Handler for open-in-mpv, a simple web extension which helps open video in mpv."
arch=('x86_64')
url="https://github.com/Baldomo/${pkgname}"
license=('GPL3')
depends=('mpv')
makedepends=(
  'go'
  'make'
)
source=("$pkgname-$pkgver.zip::https://github.com/Baldomo/${pkgname}/archive/refs/tags/v${pkgver}.zip")
sha256sums=('ab55c5d37abb03504fdebf157e03fa5b338ad72cb63d3fc94ab41debee9fa317')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    export GOFLAGS="-buildmode=pie -trimpath"
    make "build/linux/open-in-mpv"
    mkdir -p "${pkgdir}/usr/bin"
    cp "build/linux/open-in-mpv" "${pkgdir}/usr/bin"
}