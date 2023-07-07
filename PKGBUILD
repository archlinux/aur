# Maintainer: Ashley Bone <ashley DOT bone AT pm DOT me>
pkgname=python-cronsim
_name=${pkgname#python-}
_pkgver=2.5
pkgver=2.5.0
pkgrel=1
pkgdesc="A python cron expression parser and evaluator."
arch=('any')
url="https://github.com/cuu508/cronsim"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/cuu508/cronsim/archive/refs/tags/$_pkgver.tar.gz")
sha256sums=('bb1e856ce942e4ab074b8c3bb08f7f82f84666bdaed4b07058f9f0b9cda30cdd')

build() {
  cd "$_name-$_pkgver"
  python setup.py build
}

package() {
  cd "$_name-$_pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
