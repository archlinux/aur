# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-traittypes'
_module='traittypes'
pkgver='0.2.3'
pkgrel=1
pkgdesc="Traitlet types for NumPy, SciPy and friends."
url="https://github.com/jupyter-widgets/traittypes"
depends=('python'
    'python-traitlets'
    'python-numpy'
    'python-pandas')
checkdepends=(python-pytest python-xarray)
makedepends=(python-build python-installer python-setuptools)
license=(BSD-3-Clause)
arch=('any')
source=("https://github.com/jupyter-widgets/traittypes/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('246bfe43a79baead43b651133f6f90cf1c8f43c3e4deb2d59574f583afeb2964')

build() {
    cd "${_module}-${pkgver}"
    python -m build -wn
}

package() {
    cd "${_module}-${pkgver}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#check() {
    #cd "${_module}-${pkgver}"
    #PYTHONPATH=. pytest
#}
