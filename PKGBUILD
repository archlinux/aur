# Maintainer: alba4k <blaskoazzolaaaron@gmail.com>
pkgname=albafetch
pkgver=4.2
pkgrel=1
pkgdesc="Neofetch, but written in C; both faster and worse than the original"
arch=(x86_64 aarch64)
url="https://github.com/alba4k/albafetch"
license=('MIT')
makedepends=(git make gcc)
depends=(pciutils)
provides=($pkgname=$pkgver)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")

md5sums=('f89ede1b54515379dd1b2a9abfbe7573')

build() {
    cd $pkgname-$pkgver
    make CC=gcc build/$pkgname
}

package() {
    cd $pkgname-$pkgver
    make PKGNAME=$pkgname INSTALLPATH="$pkgdir/usr/bin" CONFIGPATH="$pkgdir/etc/xdg" DATAPATH="$pkgdir/usr/share" install
}

