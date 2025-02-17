# Maintainer: Konstantin Gizdov <arch at kge dot pw>

_name='azure-storage-blob'
pkgname=python-${_name}
pkgver=12.24.1
pkgrel=1
pkgdesc="Microsoft Azure Blob Storage Client Library for Python."
url="https://github.com/Azure/azure-sdk-for-python/tree/main/sdk/storage/azure-storage-blob"
depends=('python' 'python-azure-core>=1.30.0' 'python-cryptography>=2.1.4' 'python-isodate>=0.6.1' 'python-typing_extensions>=4.6.0')
makedepends=('python-installer' 'python-setuptools' 'python-wheel')
optdepends=('python-aiohttp')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('052b2a1ea41725ba12e2f4f17be85a54df1129e13ea0321f5a2fcc851cbf47d4')

build() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"/${_name//-/_}-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1
}
