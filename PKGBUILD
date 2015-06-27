# Maintainer: Robert Schwarz <mail@rschwarz.net>
pkgname="huhfa"
pkgver="0.0"
pkgrel="1"
pkgdesc="A Framework For Facet Classification"
arch=("i686" "x86_64")
url="http://comopt.ifi.uni-heidelberg.de/people/hildenbrandt/HUHFA/"
license=("GPL")
depends=("gcc-libs")
source=("$pkgname-$pkgver.zip::$url/HUHFA.zip")
md5sums=("080ce9c8d0ed89d72962378d20f19a59")

build() {
    cd "$srcdir/HUHFA"
    make
}

package() {
    cd "$srcdir/HUHFA"

    install -d $pkgdir/usr/bin $pkgdir/usr/share/doc/$pkgname
    install -D -m 755 huhfa $pkgdir/usr/bin
    install -D -m 644 Manual/* $pkgdir/usr/share/doc/$pkgname
}
