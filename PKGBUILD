# Maintainer: jdkaplan <jdkaplan@metagram.net>

pkgname=tako
pkgver=0.2.4
pkgrel=2
pkgdesc="A command language and shell based on Python"
arch=('any')
url="https://takoshell.org/"
license=('custom:Soopycat2')
depends=('python')
makedepends=('python-setuptools')
conflicts=('tako-git')
install=tako.install
source=("https://takoshell.org/releases/takoshell-$pkgver.tar.gz")
sha256sums=('6116f0eb10b91a24edc2d37dd839eb4833548f0e20ce4fba3f69dd2c38635c49')

package() {
  cd "$srcdir/takoshell-$pkgver"
  python setup.py install --root=$pkgdir
  install -D -m644 "takoshell/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/license"
}
