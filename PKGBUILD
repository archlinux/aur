# Maintainer: Ashley Bone <ashley DOT bone AT pm DOT me>
pkgname=python-cronsim
_name=${pkgname#python-}
pkgver=2.0
pkgrel=1
pkgdesc="A python cron expression parser and evaluator."
arch=('any')
url="https://github.com/cuu508/cronsim"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/cuu508/cronsim/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('60201910d7dad1307848c3e9f09a8187732058cd5eea661d54fe38f7caea51b0')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
