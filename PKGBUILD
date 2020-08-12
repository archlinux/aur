# Maintainer: Michal Wojdyla <micwoj9292 at gmail dot com>
# Contributor: Michael Goehler <somebody dot here at gmx dot de>

pkgname=python-sn3218
epoch=1
pkgver=1.2.7
pkgrel=1
pkgdesc="Python library for the SN3218 18-channel LED driver."
arch=('armv6h')
url="https://github.com/pimoroni/sn3218"
license=('GPL')
depends=('python' 'python-smbus-git')
makedepends=('python' 'git')
source=($pkgname::https://github.com/pimoroni/sn3218/archive/v"$pkgver".tar.gz)
sha256sums=('db6745bb1a1438509221ff13bccf3d7247ea26c1668d9256c36d5ca451ed6291')

build() {
  cd "$srcdir/sn3218-"$pkgver"/library"
  python setup.py build
}

package() {
  cd "$srcdir/sn3218-"$pkgver"/library"
  python setup.py install --root="$pkgdir/" --optimize=1
}
