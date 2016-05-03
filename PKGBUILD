# Maintainer: Thomas Jost <schnouki@schnouki.net>
# Contributor: Andrey Mikhaylenko <neithere at gmail dot com>
pkgname=(python-slugify python2-slugify)
pkgbase=python-slugify
pkgver=1.2.0
pkgrel=2
pkgdesc="A Python slugify application that handles unicode"
arch=(any)
url="https://github.com/un33k/python-slugify"
license=('BSD')
makedepends=("python-setuptools" "python2-setuptools")
source=(http://pypi.python.org/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('cf93234028a5c504834fc03a5bfb25db')
sha256sums=('47f1bb3ea858d00073e3e1550a88ac20709660344e9727178d60478c4d3bb94e')

package_python-slugify() {
  depends=("python" "python-unidecode>=0.04.16")
  cd "$srcdir/$pkgbase-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-slugify() {
  depends=("python2" "python2-unidecode>=0.04.16")
  cd "$srcdir/$pkgbase-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
  mv "$pkgdir/usr/bin/slugify" "$pkgdir/usr/bin/slugify2"
}
