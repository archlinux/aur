# Maintainer: jdkaplan <jdkaplan@metagram.net>

pkgname=tako
pkgver=0.1.1
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
sha256sums=('9b54fd018b804ac25ea7a3f33ffea9a51bbe8c6d341f6c5c6e3de0c532930dcd')

package() {
  cd "$srcdir/takoshell-$pkgver"
  python setup.py install --root=$pkgdir
  install -D -m644 "takoshell/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/license"
}
