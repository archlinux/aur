# Maintainer: Aalivexy <aalivexy@outlook.com>
pkgname=python-pyncm
_name=${pkgname#python-}
pkgver=1.6.18
pkgrel=1
pkgdesc="NeteaseCloudMusic APIs for Python 3.x 适用于 Python 3 的网易云音乐 API"
arch=(any)
url=https://github.com/mos9527/pyncm
license=('Apache-2.0')
depends=(python-requests)
makedepends=(python-build python-installer python-wheel python-setuptools)
optdepends=(
    'python-mutagen: Metadata modification support'
    'python-tqdm: Downlopython-setuptoolsad progress bar support'
    'python-coloredlogs: Colored terminal output support'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('004e02004dab797a37e7e9416d57b6644155b71e9806baae21a82e3b80529a55')
build() {
    cd $_name-$pkgver
    rm -r demos
    python -m build --wheel --no-isolation
}
package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}