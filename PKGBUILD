# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

_pkgname=cylp
pkgname=python-$_pkgname
pkgver=0.91.5
pkgrel=1
pkgdesc="A Python interface to CLP, CBC, and CGL to solve LPs and MIPs"
arch=('x86_64')
url="https://github.com/coin-or/CyLP"
license=('EPL')
depends=('python-scipy' 'coin-or-cbc')
makedepends=('python-setuptools' 'cython')
source=("$url/releases/download/v$pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('d68ab1dde125be60abf45c8fd9edd24ab880c8144ad881718ddfa01ff6674c77')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" -O1 --skip-build
  install -Dm755 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
