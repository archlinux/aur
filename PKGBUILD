# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=('python-kealib')
_kea=1.4.12
pkgver=0.1_$_kea
pkgrel=1
pkgdesc="Python library to access parts of kealib not exposed by GDAL"
arch=('x86_64')
url='http://kealib.org'
license=('MIT')
makedepends=('python-setuptools')
depends=("kealib=$_kea" 'python')
options=(!emptydirs)
source=("https://bitbucket.org/chchrsc/kealib/get/kealib-$_kea.tar.bz2")
sha256sums=('844cdef518ab3fe3b6bae4bce5c1ca46e9ac9ff453b5ca5f3ccd87b23b89d511')
_srcpath=chchrsc-kealib-e042a597679f

build() {
  cd "$srcdir/$_srcpath/python"
  python setup.py build
}

package() {
  cd "$srcdir/$_srcpath/python"
  python setup.py install --root="$pkgdir/" --skip-build
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
