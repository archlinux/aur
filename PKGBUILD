# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=python-aranet4
_name=${pkgname#python-}
pkgver=2.2.2
pkgrel=1
pkgdesc="Python client for Aranet4 CO2 sensors"
arch=(any)
url="https://github.com/Anrijs/Aranet4-Python"
license=('MIT')
depends=("python-bleak" "python-requests")
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('36c95bf6656241cf00459ea3d80d2d9ebe3a8346d9296773b6153dd26b4bca62')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
