# Maintainer: kachelaqa <kachelaqa at gmail dot com>

pkgname='pkgbrowser'
pkgver=0.12
pkgrel=1
pkgdesc='A utility for browsing pacman databases and the AUR'
arch=('i686' 'x86_64')
url='http://code.google.com/p/pkgbrowser/'
license=('GPL2')
depends=('pacman>=4' 'python2>=2.7' 'python2-pyqt')
install="$pkgname.install"
source=("http://$pkgname.googlecode.com/files/$pkgname-$pkgver.tar.gz")

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX='/usr' || return 1
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX='/usr' DESTDIR="$pkgdir" install || return 1
}

md5sums=('4d94c65a86adf515ed606afd4f56bde8')
