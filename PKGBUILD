# Maintainer: Ashley Bone <ashley DOT bone AT pm DOT me>
pkgname=python-cronsim
_name=${pkgname#python-}
pkgver=2.4.1
pkgrel=1
pkgdesc="A python cron expression parser and evaluator."
arch=('any')
url="https://github.com/cuu508/cronsim"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/cuu508/cronsim/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('e32d45fdb0a0e12f8ce49507ae7f5f8f594e8b7941d83eb8d7d2ffb4b73a4279')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
