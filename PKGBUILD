# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-aiologger
pkgver=0.7.0
pkgrel=1
pkgdesc='Asynchronous logging for python and asyncio'
arch=('x86_64')
url='https://github.com/b2wdigital/aiologger'
license=('MIT')
depends=('python')
optdepends=('python-aiofiles')
makedepends=('python' 'python-setuptools')
source=("$pkgname-$pkgver::https://github.com/async-worker/aiologger/archive/$pkgver.tar.gz")
sha256sums=('eb15ba148ee3ec51d12d88719eb66a620616ce5125dda445597bb5cd72393ef4')

_pkgname=aiologger

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
