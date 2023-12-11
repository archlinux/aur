# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-setupmeta'
_pkgname='setupmeta'
pkgver='3.6.0'
pkgrel=1
pkgdesc="Simplify your setup.py"
url="https://github.com/codrsquad/setupmeta"
depends=('python')
#checkdepends=('python-pep440' 'python-pytest')
optdepends=()
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('2989bd850bde578f7e3dd8878ce5488194d863e0fbbe76b18bc345a6e29fae8b')

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
