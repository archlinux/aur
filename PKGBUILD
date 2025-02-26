# Maintainer: a821 at (nospam) mail dot de
# Contributor: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-chess
pkgver=1.11.2
pkgrel=1
pkgdesc="Chess library with move generation/validation and common format support"
arch=(any)
url=https://github.com/niklasf/python-chess
license=('GPL-3.0-or-later')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/niklasf/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('cd920994700e700c0354f56b73a2591f652a44fa2ff28552d89c975bd820c647')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname-$pkgver
  python test.py
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
