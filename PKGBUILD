# Maintainer: Marko Semet <marko10_000@mailbox.org>
# Contributor: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Rafael Fontenelle <rafaelff@gnome.org>

_name=pyroaring
pkgname=python-$_name
pkgver=0.4.2
pkgrel=1
pkgdesc="Fast and lightweight set for unsigned 32 bits integers"
arch=('x86_64')
url="https://pypi.org/pypi/$_name"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('1413ab1db044032eac11ed7e9b52e93ebc26f637b299f8047ee46b03c2d828b2')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
