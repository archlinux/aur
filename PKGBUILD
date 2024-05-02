# Maintainer: KiWi42 < pullthisplug dash aur at yahoo dot com >
# Contributor: algebro

pkgname=python-libnmap
pkgver=0.7.3
pkgrel=1
pkgdesc="Python NMAP library enabling you to start async nmap tasks, parse and compare/diff scan results. Python 3 version from PyPi"
arch=('any')
url="https://github.com/savon-noir/python-libnmap"
license=('Apache-2.0')
depends=('python')
optdepends=('python-sqlalchemy' 'python-pymongo' 'python-boto')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/p/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('d03629256c2ee9ab37390c28d4c4c2ae9637cd0861dd8ab9e0f32779545936c0')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root=$pkgdir --optimize=1 --skip-build

  cd "$srcdir"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
}
