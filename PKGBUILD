# Maintainer: Dennis Fink <dennis.fink@c3l.lu>

pkgname=patternutils
pkgver=0.0.9
_pkghash=47eaa7719f84
pkgrel=1
pkgdesc="Combine regular expressions with template engines in a powerful matter."
arch=('any')
url="https://projects.metalgamer.eu/patternutils"
license=('GPL3')
depends=('python' 'python-click' 'python-jinja' 'python-pygments' 'python-feedparser')
source=('patternutils-0.0.9.zip::https://projects.metalgamer.eu/patternutils/archive/47eaa7719f848a015eff4a27300893a9e9c44e40.zip?subrepos=false')
sha512sums=('763cfe26d0d594dce4b3d7366b98990a0effcd94dd5487409f76ae6b7d82da6eeb7acb4dd46bc173fc979f217820460ddbd8a887b589aebeb649e0e051a61e0f')

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
