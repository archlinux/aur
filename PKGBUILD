# Maintainer: Stanislav Nikitin <pztrn@pztrn.name>
# Contributor: Ezra Sharp <nicekiwi@gmail.com>

pkgname=webissues-client
_pkgname=webissues
pkgver=1.1.5
pkgrel=2
pkgdesc="An open source, multi-platform system for issue tracking and team collaboration."
arch=("any")
url="http://webissues.mimec.org/"
license=("GPL3")
depends=("qt5-base>=5.6.2")
conflicts=("webissues")
provides=("webissues")
source=("http://downloads.sourceforge.net/$_pkgname/$_pkgname-$pkgver.tar.bz2")
md5sums=("1cfb2162ce5223238b1999bfd8bad51d")

build() {
    cd "$srcdir/$_pkgname-$pkgver"

    ./configure -prefix /usr -destdir "$pkgdir" -system-sqlite
    make
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}

