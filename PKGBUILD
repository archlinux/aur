# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
_pkgname=affine
pkgname=python-${_pkgname}
pkgver=2.2.2
pkgrel=1
pkgdesc="Python package for matrices describing affine transformation of the plane"
url="https://github.com/sgillies/affine"
depends=('python'
         'python-pip'
)
optdepends=()
license=('BSD')
arch=('any')
source=("https://pypi.python.org/packages/source/a/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('ff0d0f40a90faa651f7bc7fece15bdbb7a0e0658b1e7ba6a03422c21efa7da90')

build() {
    cd "$srcdir/${_pkgname}-$pkgver"
   python setup.py build
}

package() {
    cd "$srcdir/${_pkgname}-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
}
