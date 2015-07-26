# Maintainer: David Bailey <david.bailey@archlinux.net>

pkgname=zinnia-python
pkgver=0.06
pkgrel=1
pkgdesc="Simple, customizable and portable online hand recognition system based on Support Vector Machines, Python bindings"
arch=('i686' 'x86_64')
url="http://zinnia.sourceforge.net/"
license=('BSD')
depends=('python2' 'zinnia>=0.06')
makedepends=('python2')
options=(!emptydirs)
source=("http://downloads.sourceforge.net/project/zinnia/zinnia/$pkgver/zinnia-$pkgver.tar.gz")
sha256sums=('ece3af93f937282971634fd81d3e997f848e8cfa958220e26a4564ca064ac20b')

build() {
  cd "$srcdir/zinnia-$pkgver/python"
  python2 setup.py build
}

package() {
  cd "$srcdir/zinnia-$pkgver/python"
  python2 setup.py install --prefix=$pkgdir/usr --optimize=1
  install -D -m644 $srcdir/zinnia-$pkgver/COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
