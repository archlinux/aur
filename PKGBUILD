# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-aiologger
pkgver=0.6.0
pkgrel=1
pkgdesc='Asynchronous logging for python and asyncio'
arch=('x86_64')
url='https://github.com/b2wdigital/aiologger'
license=('MIT')
depends=('python')
optdepends=('python-aiofiles')
makedepends=('python' 'python-setuptools')
source=("$pkgname-$pkgver::https://github.com/b2wdigital/aiologger/archive/$pkgver.tar.gz")
sha256sums=('38d116fdd931da99cde836ecaf1e3e9389efcd2dafc0a300670f9353f4aa18b2')

_pkgname=aiologger

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
