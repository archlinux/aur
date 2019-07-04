# Maintainer: mbb <mochobb@clix.pt>

pkgname=falkon-pdfreader-git
url="https://github.com/Tarptaeya/PDFReader"
VER=$(git ls-remote $url HEAD)
pkgver=${VER:0:7}
pkgrel=0
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
    cd "$srcdir/$pkgname"
    mkdir -p "$pkgdir/usr/lib/qt/plugins/falkon/qml"
    cp -R "pdfreader" "$pkgdir/usr/lib/qt/plugins/falkon/qml"
}
