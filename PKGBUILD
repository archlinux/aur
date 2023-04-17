# Maintainer: Syping <aur@syping.de>
pkgname=gta5view-bin
pkgver=1.10.2
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
sha256sums=("841e6d9c46ba51ca1bf03eb9bf268cbe9abb300ec547235b4595457f0cd7741f")

prepare() {
    ar x ${pkgname%-bin}_$pkgver-${pkgrel}_amd64.deb
    tar xfJ data.tar.xz
}

package() {
    cp -Rp ./usr $pkgdir/
}
