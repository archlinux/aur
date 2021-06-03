# Maintainer: Syping <aur@syping.de>
pkgname=gta5view-bin
pkgver=1.10.0
pkgrel=1
epoch=
pkgdesc="Open Source Snapmatic and Savegame viewer/editor for GTA V"
arch=('x86_64')
url="https://gta5view.syping.de/"
license=('GPL')
depends=(qt5-base qt5-svg qt5-translations)
makedepends=(binutils)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("https://github.com/SyDevTeam/${pkgname%-bin}/releases/download/$pkgver/${pkgname%-bin}_$pkgver-${pkgrel}_amd64.deb")
noextract=("${pkgname%-bin}_$pkgver-${pkgrel}_amd64.deb")
sha256sums=("446c98dd84074d3060c8d4b54580e5d5ce4b5c19656b9c5947ab2a55b477750d")

prepare() {
    ar x ${pkgname%-bin}_$pkgver-${pkgrel}_amd64.deb
    tar xfJ data.tar.xz
}

package() {
    cp -Rp ./usr $pkgdir/
}
