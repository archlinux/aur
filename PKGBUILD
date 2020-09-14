# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-aiologger
pkgver=0.5.1
pkgrel=1
pkgdesc='Asynchronous logging for python and asyncio'
arch=('x86_64')
url='https://github.com/b2wdigital/aiologger'
license=('MIT')
depends=('python')
optdepends=('python-aiofiles')
makedepends=('python' 'python-setuptools')
source=("$pkgname-$pkgver::https://github.com/b2wdigital/aiologger/archive/$pkgver.tar.gz")
sha256sums=('c1cea0e9a9b553918d19d939ce1fd4fb6c596faa14a6593c13efc31d099d33bc')

_pkgname=aiologger

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
