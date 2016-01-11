# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=python-umsgpack
_pkgname=${pkgname/python-/}
pkgver=0.1.0
pkgrel=1
pkgdesc="Unicode-friendly msgpack wrapper"
url="https://github.com/minrk/umsgpack"
depends=('python' 'python-twisted')
optdepends=()
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/u/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('6e8fd8759136e48e04304523d3d4e218289ceba23c4e325986db6ca5c4d3783a')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
    rm -rf ${pkgdir}/usr/lib/python*/site-packages/tests/
}

