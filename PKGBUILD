# Maintainer: Ashley Bone <ashley DOT bone AT pm DOT me>
pkgname=python-cronsim
_name=${pkgname#python-}
pkgver=2.1
pkgrel=1
pkgdesc="A python cron expression parser and evaluator."
arch=('any')
url="https://github.com/cuu508/cronsim"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/cuu508/cronsim/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('7f11c640d0091f113591376a4db85b4b7689f7cabb45faabfc9b3bbc7ee2f61f')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
