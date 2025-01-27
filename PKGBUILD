# Maintainer: a821 at (nospam) mail dot de
# Contributor: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-chess
pkgver=1.11.1
pkgrel=1
pkgdesc="Chess library with move generation/validation and common format support"
arch=(any)
url=https://github.com/niklasf/python-chess
license=('GPL-3.0-or-later')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/niklasf/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('31020e16267f88b48b47c028bd61125d673324b50aded460a3375c40c3231ca6')

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
