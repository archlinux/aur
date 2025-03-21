# Maintainer: Konstantin Gizdov <arch at kge dot pw>

_name='azure-storage-blob'
pkgname=python-${_name}
pkgver=12.25.0
pkgrel=1
pkgdesc="Microsoft Azure Blob Storage Client Library for Python."
url="https://github.com/Azure/azure-sdk-for-python/tree/main/sdk/storage/azure-storage-blob"
depends=('python' 'python-azure-core' 'python-cryptography' 'python-typing_extensions' 'python-isodate')
makedepends=('python-installer' 'python-setuptools' 'python-build' 'python-wheel')
optdepends=('python-aiohttp')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('42364ca8f9f49dbccd0acc10144ed47bb6770bf78719970b51915f048891abba')

build() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
