# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Joseph Brains <jnbrains@gmail.com>

_pkgname=python-zipstream
pkgname="$_pkgname"-gns3
pkgver=1.1.4
pkgrel=2
pkgdesc="Zipfile generator (GNS3)"
arch=('any')
url="https://github.com/allanlei/$_pkgname"
license=('GPL3')
groups=('gns3')
depends=('python')
makedepends=('python-setuptools')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname-$pkgver.tar.gz::https://github.com/allanlei/python-zipstream/archive/v$pkgver.tar.gz")
sha256sums=('32a7a4bdb786914445589595273beffbbf9b6a0a3a3dc2cf19ea96114bd2abd7')

build() {
    cd "$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$_pkgname-$pkgver"
    python3 setup.py install --root="$pkgdir" --optimize=1
}
