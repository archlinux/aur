# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-aiologger
pkgver=0.6.1
pkgrel=1
pkgdesc='Asynchronous logging for python and asyncio'
arch=('x86_64')
url='https://github.com/b2wdigital/aiologger'
license=('MIT')
depends=('python')
optdepends=('python-aiofiles')
makedepends=('python' 'python-setuptools')
source=("$pkgname-$pkgver::https://github.com/b2wdigital/aiologger/archive/$pkgver.tar.gz")
sha256sums=('03dd32b8b6218528b7e5f143c32c0727731f5d6700cfd6108ba42f87e3ad9963')

_pkgname=aiologger

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
