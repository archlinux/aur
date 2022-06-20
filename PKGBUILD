# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-formulaic'
_pkgname='formulaic'
pkgver='0.3.4'
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
makedepends=(python-build python-installer python-poetry-core python-poetry-dynamic-versioning python-wheel)
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('2f841297d27dbd19f51dadea35887c363512d6eed70503b453e0f59c679d0f54')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation

}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

#check() {
    #cd "${_pkgname}-${pkgver}"
    #PYTHONPATH=. pytest tests
#}
