# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Joseph Brains <jnbrains@gmail.com>

_pkgname=async-timeout
pkgname=python-"$_pkgname"-gns3
pkgver=3.0.0
pkgrel=1
pkgdesc='Asyncio-compatible timeout class (GNS3)'
arch=('any')
url="https://github.com/aio-libs/async-timeout"
license=('Apache')
groups=('gns3')
depends=('python')
makedepends=('python-setuptools')
provides=("python-$_pkgname")
conflicts=("python-$_pkgname")
source=("$pkgname-$pkgver.tar.gz::https://github.com/aio-libs/async-timeout/archive/v$pkgver.tar.gz")
sha256sums=('48341ca53e51d5e975154e14f3d75444355243482c7319bb95b727a487d92cc8')

build() {
    cd "$_pkgname-$pkgver"
    python3 setup.py build
}

package() {
    cd "$_pkgname-$pkgver"
    python3 setup.py install --root="$pkgdir" --optimize=1
}
