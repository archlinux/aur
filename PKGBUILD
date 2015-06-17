# Maintainer: Ezra Sharp <nicekiwi@gmail.com>

pkgname=webissues-client
pkgver=1.1.3
pkgrel=1
pkgdesc='An open source, multi-platform system for issue tracking and team collaboration.'
arch=('any')
url='http://webissues.mimec.org/'
license=('GPL3')
depends=('qt4>=4.4.2')
conflicts=('webissues')
provides=('webissues')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2")
md5sums=('6e00a2c5af5df27db7ac57b93077ffeb')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    ./configure -prefix /usr -destdir "$pkgdir" -system-sqlite
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}

