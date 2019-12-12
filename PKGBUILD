# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Joseph Brains <jnbrains@gmail.com>

_pkgname=async-timeout
pkgname=python-"$_pkgname"-gns3
pkgver=3.0.1
pkgrel=2
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
sha256sums=('d0a7a927ed6b922835e1b014dfcaa9982caccbb25131320582cc660af7c93949')

build() {
    cd "$_pkgname-$pkgver"
    python3 setup.py build
}

package() {
    cd "$_pkgname-$pkgver"
    python3 setup.py install --root="$pkgdir" --optimize=1
}
