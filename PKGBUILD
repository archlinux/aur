# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-setupmeta'
_pkgname='setupmeta'
pkgver='3.3.0'
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
sha256sums=('32914af4eeffb8bf1bd45057254d9dff4d16cb7ae857141e07698f7ac19dc960')

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
