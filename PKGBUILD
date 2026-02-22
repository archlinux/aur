# Maintainer: link2xt <link2xt@testrun.org>
pkgname=python-securestring
_name=SecureString
pkgver=0.2
pkgrel=1
pkgdesc="Clears the contents of strings containing cryptographic material"
arch=(x86_64)
url="https://pypi.python.org/pypi/SecureString"
license=('MIT')
makedepends=(python-build python-installer python-wheel python-setuptools)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz)
noextract=()
b2sums=('c77f0d6ae7980865120f268cc1cbe73fdd58afd87a9aa7727f7dcc9ee2bb4760bea4a8889c746e4c796b1e39c35cad4016ccd3760e0f19effd45c767016f9198')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
