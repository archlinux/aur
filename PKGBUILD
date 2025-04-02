# Maintainer: Balakrishnan Balasubramanian <aur@balki.me>
# Maintainer: Philipp A. <flying-sheep@web.de>

_name=genson
pkgname=python-$_name
pkgver=1.3.0
pkgrel=11
pkgdesc='GenSON is a powerful, user-friendly JSON Schema generator.'
arch=(any)
url="https://github.com/wolverdude/$_name"
license=(MIT)
depends=(python)
makedepends=(python-setuptools python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('e02db9ac2e3fd29e65b5286f7135762e2cd8a986537c075b06fc5f1517308e37')


build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
