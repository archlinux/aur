# Maintainer: Sean Anderson <seanga2@gmail.com>
pkgname=python-pyfdt
_name=${pkgname#python-}
pkgver=0.3
pkgrel=1
pkgdesc="Python flattened device tree parser "
arch=('any')
url="https://github.com/superna9999/pyfdt"
license=('Apache')
groups=()
depends=('python')
makedepends=('python-setuptools')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('f66cfa3fd5b8a49334464a6dc8a2cb3d99e8e4a521b04a39a2dda32fdbedba4420be91b28533f7421c28ea1a98b240f1b3d753a0311bcaed76f7005016e59090')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
