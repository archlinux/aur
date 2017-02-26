# Maintainer: jdkaplan <jdkaplan@metagram.net>

pkgname=tako
pkgver=0.0.19
pkgrel=1
pkgdesc="A command language and shell based on Python"
arch=('any')
url="https://takoshell.org/"
license=('custom:Soopycat2')
depends=('python')
makedepends=('python-setuptools')
conflicts=('tako-git')
install=tako.install
source=("https://takoshell.org/takoshell-$pkgver.tar.gz")
sha256sums=('a064eafb7d53bd90cf6de5c891df90508bc319de49d3a0009e34fedf1e5b8aa1')

package() {
  cd "$srcdir/takoshell-$pkgver"
  python setup.py install --root=$pkgdir
  install -D -m644 "takoshell/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/license"
}
