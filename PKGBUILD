# Maintainer: Thomas Jost <schnouki@schnouki.net>
# Contributor: Andrey Mikhaylenko <neithere at gmail dot com>
pkgname=(python-slugify python2-slugify)
pkgbase=python-slugify
pkgver=1.2.1
pkgrel=1
pkgdesc="A Python slugify application that handles unicode"
arch=(any)
url="https://github.com/un33k/python-slugify"
license=('BSD')
makedepends=("python-setuptools" "python2-setuptools")
source=(https://github.com/un33k/python-slugify/archive/${pkgver}.tar.gz)
md5sums=('f0356326c15c382faa7fcfff9195451c')
sha256sums=('bc595c33d1735fc4b5db4333ac30b73e41c1f4fdb4f9898ddeed9aab3001cb7d')

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
