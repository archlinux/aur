# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Joseph Brains <jnbrains@gmail.com>

_pkgname=multidict
pkgname=python-"$_pkgname"-gns3
pkgver=4.7.4
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
sha256sums=('aedb9c1a44c500a14610d67d6d30864e6b5aa34c209161fde00fa7e93de98308')

build() {
  cd "$_pkgname-$pkgver"
  python3 setup.py build
}

package() {
  cd "$_pkgname-$pkgver"
  python3 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
