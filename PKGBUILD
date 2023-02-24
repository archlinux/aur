# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=python-aranet4
_name=${pkgname#python-}
pkgver=2.1.3
pkgrel=1
pkgdesc="Python client for Aranet4 CO2 sensors"
arch=(any)
url="https://github.com/Anrijs/Aranet4-Python"
license=('MIT')
depends=("python-bleak" "python-requests")
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('d9750ced22c5ffd6bc9f67f450ad5c8767ab3247fe247971740e34566c6e10e1')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
