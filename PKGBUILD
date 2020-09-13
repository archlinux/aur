# Maintainer: Jakob Schöttl <jschoett gmail com>
# Maintainer: phi <phi at qgr dot se>
# Contributor: smlb <smlb at riseup dot net>

pkgname=dockd
pkgver=1.3
pkgrel=1
pkgdesc="Lenovo ThinkPad Dock Management Daemon"
arch=('i686' 'x86_64')
url="https://github.com/libthinkpad/dockd"
license=('BSD')
depends=('libthinkpad' 'libxrandr')
makedepends=('cmake')
source=("https://github.com/libthinkpad/dockd/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('38f09d34554154781c91d6f71d4e9812')

prepare() {
    mkdir -p "$srcdir/$pkgname-$pkgver/etc"
}

build() {
    cmake . -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    install -Dm755 -d etc "$pkgdir/etc/$pkgname"
    make DESTDIR=$pkgdir install
}
