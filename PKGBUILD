# Maintainer: jdkaplan <jdkaplan@metagram.net>

pkgname=tako
pkgver=0.0.18
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
sha256sums=('496aa6041db8f0b7c93a8a5e2e2a32723357491c4cedb5493db7b94c734fc104')

package() {
  cd "$srcdir/takoshell-$pkgver"
  python setup.py install --root=$pkgdir
  install -D -m644 "takoshell/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/license"
}
