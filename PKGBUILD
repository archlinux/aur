# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=('python-ufo2ft')
_pkgname='ufo2ft'
pkgver='2.9.1'
pkgrel=1
pkgdesc="A bridge from UFOs to FontTools objects."
url="https://github.com/googlefonts/ufo2ft"
checkdepends=('python-pytest' 'python-skia-pathops')
depends=('python' 'python-booleanoperations' 'python-compreffor' 'python-cu2qu' 'python-defcon' 'python-fonttools')
makedepends=('python-setuptools')
optdepends=()
license=('MIT')
arch=('any')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.zip")
sha256sums=('224a37cc3a88f9c4a5194524e5d5814ddbf64da6134f251762082ed7e34bd92a')

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

check() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py test
}
