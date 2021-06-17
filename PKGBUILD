# Maintainer: Syping <aur@syping.de>
pkgname=gta5view-bin
pkgver=1.10.1
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
sha256sums=("8ac5db85eab533e3b07567f62be1c1665db3052bb68a10967f56ce2d3233c5a9")

prepare() {
    ar x ${pkgname%-bin}_$pkgver-${pkgrel}_amd64.deb
    tar xfJ data.tar.xz
}

package() {
    cp -Rp ./usr $pkgdir/
}
