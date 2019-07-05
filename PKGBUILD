# Maintainer: mbb <mochobb at clix dot pt>
# Contributor: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

pkgname=falkon-pdfreader-git
url="https://github.com/Tarptaeya/PDFReader"
VER=$(git ls-remote $url HEAD)
pkgver=${VER:0:7}
pkgrel=1
pkgdesc="PDF reader plugin for Falkon browser"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('falkon')
makedepends=('git')
provides=('falkon-pdfreader')
conficts=('falkon-pdfreader')
source=("$pkgname"::'git+https://github.com/Tarptaeya/PDFReader.git')
md5sums=('SKIP')

package() {
    mkdir "$srcdir/$pkgname/build"
    cd "$srcdir/$pkgname/build"
    cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" -DCMAKE_INSTALL_LIBDIR="lib/qt" ..
    make install
}
