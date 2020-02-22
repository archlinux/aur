# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: jdkaplan <jdkaplan@metagram.net>

_pkgname=takoshell
pkgname=tako
pkgver=0.2.7
pkgrel=1
pkgdesc="command language and shell based on Python"
arch=('any')
url="https://takoshell.org/"
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')
install=tako.install
source=("https://takoshell.org/releases/takoshell-$pkgver.tar.gz")
sha256sums=('4c1fe66927f13676dd904fff3017d1a51e63f74eb47f6bc76583bb3bb47f0cd3')


build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
