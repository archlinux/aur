# Maintainer: Konstantin Gizdov <arch at kge dot pw>
# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=azure-storage-blob
pkgname=python-$_name
pkgver=12.31.0
pkgrel=1
pkgdesc='Microsoft Azure Blob Storage Client Library for Python.'
arch=('any')
url='https://github.com/Azure/azure-sdk-for-python/tree/main/sdk/storage/azure-storage-blob'
license=('MIT')
depends=('python'
         'python-azure-core'
         'python-cryptography'
         'python-typing_extensions'
         'python-isodate')
makedepends=('python-setuptools'
             'python-build'
             'python-installer'
             'python-wheel')
optdepends=('python-aiohttp: aio')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('997b393cfcbdc4b186d5911790d91f80387f7edc12c4d73eab963a2d26e5b2a9')

build() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
