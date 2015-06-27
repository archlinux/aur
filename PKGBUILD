# Maintainer: indelhi
# Contributor: Robert Schwarz <mail@rschwarz.net>
pkgname="porta"
pkgver="1.4.1"
pkgrel="1"
pkgdesc="POlyhedron Representation Transformation Algorithm"
arch=("i686" "x86_64")
url="http://typo.zib.de/opt-long_projects/Software/Porta/"
license=("GPL")
depends=("glibc")
source=("http://typo.zib.de/opt-long_projects/Software/Porta/$pkgname-$pkgver/$pkgname-$pkgver.tgz")
md5sums=("585179bf19d214ed364663a5d17bd5fc")

build() {
    cd "$srcdir/gnu-make"
    make
}

package() {
    cd "$srcdir"
    install -d $pkgdir/usr/bin $pkgdir/usr/share/man/man1 $pkgdir/usr/share/$pkgname
    install -D -m 755 gnu-make/bin/* $pkgdir/usr/bin
    install -D -m 644 man/man1/* $pkgdir/usr/share/man/man1
    install -D -m 644 {INFO,README} $pkgdir/usr/share/$pkgname
}
