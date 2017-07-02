# Maintainer: David Bailey <david.bailey@archlinux.net>

pkgname=tegaki-python
pkgver=0.3.1
pkgrel=1
pkgdesc="Base python library for Tegaki"
arch=('any')
url="http://www.tegaki.org/"
license=('GPL2')
depends=('python2' 'zinnia>=0.05' 'zinnia-python>=0.05')
makedepends=('python2')
source=("https://github.com/tegaki/tegaki/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('bd3284f56d36691710ec5b346a61f5af')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --prefix=$pkgdir/usr --optimize=1
}
