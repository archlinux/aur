# Maintainer: Ashley Bone <ashley DOT bone AT pm DOT me>
pkgname=python-cronsim
_name=${pkgname#python-}
pkgver=2.3
pkgrel=1
pkgdesc="A python cron expression parser and evaluator."
arch=('any')
url="https://github.com/cuu508/cronsim"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/cuu508/cronsim/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('ba3cb5bb7659c7fb7a747454f1e86eefcec95e5108c5129891a8c9b38bc7d93d')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
