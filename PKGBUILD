# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: jdkaplan <jdkaplan@metagram.net>

_pkgname=takoshell
pkgname=tako
pkgver=0.2.8
pkgrel=1
pkgdesc="command language and shell based on Python"
arch=('any')
url="https://takoshell.org/"
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')
install=tako.install
#source=("https://takoshell.org/releases/takoshell-$pkgver.tar.gz")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('3f2d8883d0df512e4a574a317c7fed4d352480ac6e3a97ca16789e00c2717f43')


build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
