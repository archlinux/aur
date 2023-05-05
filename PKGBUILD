# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-docformatter'
_pkgname='docformatter'
pkgver=1.5.0
pkgrel=1
pkgdesc='Format docstrings to follow PEP257'
url='https://github.com/myint/docformatter'
checkdepends=()
depends=('python-untokenize')
makedepends=(python-build python-installer python-setuptools python-wheel)
optdepends=()
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('9dc71659d3b853c3018cd7b2ec34d5d054370128e12b79ee655498cb339cc711')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

