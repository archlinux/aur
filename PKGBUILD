# Maintainer: Konstantin Gizdov <arch at kge dot pw>

_name='azure-storage-blob'
pkgname=python-${_name}
pkgver=12.25.1
pkgrel=1
pkgdesc="Microsoft Azure Blob Storage Client Library for Python."
url="https://github.com/Azure/azure-sdk-for-python/tree/main/sdk/storage/azure-storage-blob"
depends=('python' 'python-azure-core' 'python-cryptography' 'python-typing_extensions' 'python-isodate')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
optdepends=('python-aiohttp: aio')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('4f294ddc9bc47909ac66b8934bd26b50d2000278b10ad82cc109764fdc6e0e3b')

build() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
