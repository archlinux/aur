# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Joseph Brains <jnbrains@gmail.com>

_pkgname=yarl
pkgname=python-"$_pkgname"-gns3
pkgver=1.2.6
pkgrel=1
pkgdesc="Yet another URL library (GNS3)"
arch=('any')
url="https://github.com/aio-libs/yarl/"
license=('Apache')
groups=('gns3')
provides=("python-$_pkgname")
conflicts=("python-$_pkgname")
depends=('python' 'python-multidict-gns3')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/aio-libs/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=('1083cb0eb2a68638c239d96ed6b3cfe8427f5fea62aa2e575ae5511a196b5df5')

build() {
  cd "$_pkgname-$pkgver"
  python3 setup.py build
}

package() {
  cd "$_pkgname-$pkgver"
  python3 setup.py install --root="$pkgdir" --optimize=1
}
