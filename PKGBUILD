# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=('python-traittypes')
_module='traittypes'
pkgver='0.0.6'
pkgrel=1
pkgdesc="Traitlet types for NumPy, SciPy and friends."
url="https://github.com/jupyter-widgets/traittypes"
depends=('python'
    'python-traitlets'
    'python-numpy'
    'python-pandas')
checkdepends=('python-pytest')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://github.com/jupyter-widgets/traittypes/archive/${pkgver}.tar.gz")
sha256sums=('8b2a8a68ef83aa8dc11a0e3b91f83cb3b9709089db85e3ca49aec990f644748c')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

check() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m unittest
}
