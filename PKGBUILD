# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-fontpens'
_pkgname='fontPens'
pkgver='0.2.4'
pkgrel=1
pkgdesc='A collection of classes implementing the pen protocol for manipulating glyphs.'
url='https://pypi.org/project/fontPens/'
checkdepends=('python-fontmath' 'python-fontparts' 'python-pytest' 'python>=3.8')
depends=('python' 'python-fonttools')
makedepends=('python-setuptools')
optdepends=()
license=('BSD')
arch=('any')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.zip")
sha256sums=('a6d9a14573b3450f3313d69523f9006028c21fc7aef5d35333b87aab7f2b41fd')

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

#check() {
    #cd "$srcdir/$_pkgname-$pkgver"
    #python setup.py test
#}

