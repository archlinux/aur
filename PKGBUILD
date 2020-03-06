# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-aiologger
pkgver=0.5.0
pkgrel=1
pkgdesc='Asynchronous logging for python and asyncio'
arch=('x86_64')
url='https://github.com/b2wdigital/aiologger'
license=('MIT')
depends=('python')
optdepends=('python-aiofiles')
makedepends=('python' 'python-setuptools')
source=("$pkgname-$pkgver::https://github.com/b2wdigital/aiologger/archive/$pkgver.tar.gz")
sha256sums=('1f45179b36e8e9bd82223046520e827f65c93c0f541c3ca85d6ee6279d54496a')

_pkgname=aiologger

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
