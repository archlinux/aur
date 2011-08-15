# Maintainer: kachelaqa <kachelaqa at gmail dot com>

pkgname='pkgbrowser'
pkgver=0.5
pkgrel=2
pkgdesc='A utility for browsing pacman databases and the AUR'
arch=('i686' 'x86_64')
url='http://code.google.com/p/pkgbrowser/'
license=('GPL2')
depends=('pacman<4' 'python2-pyqt')
install="$pkgname.install"
source=("http://$pkgname.googlecode.com/files/$pkgname-$pkgver.tar.gz")

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make || return 1
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install || return 1
}

md5sums=('2406646442ecf44d710f36e2069e4bfb')
