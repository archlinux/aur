# Maintainer: iamawacko <iamawacko@protonmail.com>
pkgname=python-instagram-private-api
pkgver=1.6.0.0
pkgrel=1
pkgdesc="A Python wrapper for the Instagram private API with no 3rd party dependencies"
url="https://pypi.org/project/instagram-private-api/"
arch=('any')
license=('MIT')
_name="instagram_private_api"
makedepends=(python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/instagram_private_api/instagram_private_api-$pkgver.tar.gz")
sha256sums=('dfe0c2cb5aa881b98b2e428c3b02fa664a52af3f2d2354c19c4a8967cedf5d8e')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
