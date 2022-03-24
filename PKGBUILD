# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-formulaic'
_pkgname='formulaic'
pkgver='0.3.2'
pkgrel=1
pkgdesc="A high performance of Wilkinson formulas in Pythonn"
url="https://github.com/matthewwardrop/formulaic"
depends=('python'
    'python-astor'
    'python-numpy'
    'python-pandas'
    'python-scipy'
    'python-wrapt')
checkdepends=('python-pytest')
optdepends=('python-sympy')
makedepends=('python-setupmeta' 'python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('3e16262562147acbdeda1178d778ac189a93bd63e2348261bd8b5d303f173f6d')

build() {
    cd "${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

#check() {
    #cd "${_pkgname}-${pkgver}"
    #PYTHONPATH=. pytest tests
#}
