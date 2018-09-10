# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Joseph Brains <jnbrains@gmail.com>

_pkgname=multidict
pkgname=python-"$_pkgname"-gns3
pkgver=4.4.0
pkgrel=1
pkgdesc='Asyncio-based multidict implementation for Python (GNS3)'
url='https://github.com/aio-libs/multidict'
arch=('i686' 'x86_64')
license=('APACHE')
groups=('gns3')
depends=('python')
makedepends=('cython' 'python-setuptools')
provides=("python-$_pkgname")
conflicts=("python-$_pkgname")
source=("$pkgname-$pkgver.tar.gz::https://github.com/aio-libs/multidict/archive/v$pkgver.tar.gz")
sha256sums=('d2346c1ee53b352f3e51e80c14400853d13a32c01c497375ded16082fde97211')

build() {
  cd "$_pkgname-$pkgver"
  python3 setup.py build
}

package() {
  cd "$_pkgname-$pkgver"
  python3 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
