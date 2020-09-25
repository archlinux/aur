# Maintainer: Dennis Fink <dennis.fink@c3l.lu>

pkgname=patternutils
pkgver=0.0.8
_pkghash=853b2c08d397
pkgrel=1
pkgdesc="Combine regular expressions with template engines in a powerful matter."
arch=('any')
url="https://projects.metalgamer.eu/patternutils"
license=('GPL3')
depends=('python' 'python-click' 'python-jinja' 'python-pygments')
source=('patternutils-0.0.8.zip::https://projects.metalgamer.eu/patternutils/archive/853b2c08d397ad61442b8caf7d8cd4723a1dd04e.zip?subrepos=false')
sha512sums=('dc29e9403e260a04cbe986567a37ecd17bf2b335dbe99c3b274d5568252e22464b7bb52fd2e9dba459ac83d8f79eb39a832641f224fe0911522d60f6c0069a44')

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
