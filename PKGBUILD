# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: Jameson Pugh <imntreal@gmail.com>

pkgname=python2-semantic
pkgver=1.0.3
pkgrel=2
pkgdesc='Library for extracting semantic information from text, such as dates and numbers'
url='http://packages.python.org/semantic'
arch=(any)
license=(BSD)
depends=(python2-quantities)
source=(https://pypi.python.org/packages/source/s/semantic/semantic-$pkgver.tar.gz)
sha512sums=(SKIP)

build() {
  cd $srcdir/semantic-$pkgver
  python2 setup.py build || return 1
}

package() {
  cd $srcdir/semantic-$pkgver
  python2 setup.py install --prefix=/usr --root=$pkgdir || return 1
}
