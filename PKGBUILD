# Maintainer: Dennis Fink <dennis.fink@c3l.lu>

pkgname=patternutils
pkgver=0.0.10
_pkghash=f33c951669cd
pkgrel=1
pkgdesc="Combine regular expressions with template engines in a powerful matter."
arch=('any')
url="https://projects.metalgamer.eu/patternutils"
license=('GPL3')
depends=('python' 'python-click' 'python-jinja' 'python-pygments' 'python-feedparser')
source=('patternutils-0.0.10.zip::https://projects.metalgamer.eu/patternutils/archive/f33c951669cd51e527ec5e817cceb74a24400ab2.zip?subrepos=false')
sha512sums=('bfde728083917191bfd740456113f4b7c2c1cf25107bc3bc60e5d7705686b102a59a3fb28d68f3799d9026dda2da0194c9f59424148370fc4d947228a76e4616')

prepare() {
    sed -i 's/==/>=/g' "$srcdir/$pkgname-$_pkghash/setup.py"
}

build() {
    cd "$srcdir/$pkgname-$_pkghash"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$_pkghash"
    python setup.py install --root="$pkgdir" --optimize=1
}
