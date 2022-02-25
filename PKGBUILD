# Maintainer: Dennis Fink <dennis.fink@c3l.lu>

pkgname=patternutils
pkgver=0.0.12
_pkghash=845246bd20d9
pkgrel=1
pkgdesc="Combine regular expressions with template engines in a powerful matter."
arch=('any')
url="https://projects.metalgamer.eu/patternutils"
license=('GPL3')
depends=('python' 'python-click' 'python-jinja' 'python-pygments' 'python-feedparser')
source=('patternutils-0.0.12.zip::https://projects.metalgamer.eu/patternutils/archive/5b70a13b82ace3a3f0a101ce480d46ca56dfd7b0.zip?subrepos=false')
sha512sums=('cdab793f7a063564ed98f3e0b63244167bc1f39a6c35dbb8361d8d701b17e1d5e4a3ca1846f65a4213264887e1d83bb12a58d6b2358b4b7a804c42617ad551e5')

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
