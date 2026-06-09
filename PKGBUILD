# Maintainer: OpenCOMAL packager
pkgname=opencomal
pkgver=0.2.6
pkgrel=1
pkgdesc="OpenCOMAL - a free Comal implementation"
arch=("x86_64")
url="https://github.com/ProphetPX/opencomal"
license=("GPL")
# Runtime dependencies used by the program
depends=("ncurses" "readline")
makedepends=("bison" "flex" "gcc" "make")
# Use the GitHub release archive for source retrieval
source=("https://github.com/ProphetPX/opencomal/releases/download/v0.2.6/opencomal-0.2.6.tar.gz")
sha256sums=('967592e1dfe04366555fbde5df987de4e4b3234f72abc526492607fb7aa179c6')

build() {
    cd "$srcdir/opencomal-0.2.6/src"
    make
}

package() {
    cd "$srcdir/opencomal-0.2.6"
    install -d "$pkgdir/usr/bin"
    install -Dm755 "bin/opencomal" "$pkgdir/usr/bin/opencomal"
    install -Dm755 "bin/opencomalrun" "$pkgdir/usr/bin/opencomalrun"
    # optional: install docs
    install -d "$pkgdir/usr/share/doc/$pkgname"
    cp -a README.md "$pkgdir/usr/share/doc/$pkgname/"
}
