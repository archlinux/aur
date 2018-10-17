# Maintainer: David Baum <david.baum@naraesk.eu>
pkgname=python-phue
pkgver=1.0
pkgrel=1
pkgdesc="A Philips Hue Python library"
arch=('any')
url="https://github.com/studioimaginaire/phue"
license=('MIT')
depends=('python')
makedepends=('python' 'python-pip')
source=('LICENSE')
md5sums=('852ebbd5fd0880fc619e859b04cf2b6c')

build() {
  pip install --no-deps --target="phue" phue
}
package() {
  mkdir -p $pkgdir/usr/lib/python3.7/site-packages/
  cp -r $srcdir/phue/* $pkgdir/usr/lib/python3.7/site-packages/
  install -Dm644 $srcdir/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
