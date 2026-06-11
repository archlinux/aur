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
source=("opencomal-${pkgver}.tar.gz::https://github.com")
sha256sums=('8ddf49e4266f07a8f8402d3fb0c73e0006eabd9e83fbc6931eabb7fc10c29fb8')

build() {
    cd "${srcdir}/opencomal-packaging"
    make
}

package() {
    cd "$srcdir/opencomal-packaging"
    install -d "$pkgdir/usr/bin"
    install -Dm755 "bin/opencomal" "$pkgdir/usr/bin/opencomal"
    install -Dm755 "bin/opencomalrun" "$pkgdir/usr/bin/opencomalrun"
    # optional: install docs
    install -d "$pkgdir/usr/share/doc/$pkgname"
    cp -a README.md "$pkgdir/usr/share/doc/$pkgname/"
}
