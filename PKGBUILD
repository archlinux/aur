# Maintainer: Konstantin Gizdov <arch at kge dot pw>
# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=azure-storage-blob
pkgname=python-$_name
pkgver=12.31.1
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
optdepends=('python-aiohttp: aio'
            'python-azure-storage-extensions: ext-checksums')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('0d6e5b860a1357efc602db04cfa7c9950ac86126edcf7db89320cde281555fe5')

build() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
