# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=('python-kealib')
pkgver=0.1_1.4.7
pkgrel=1
pkgdesc="Python library to access parts of kealib not exposed by GDAL"
arch=('x86_64')
url='http://kealib.org'
license=('MIT')
makedepends=('kealib' 'python-setuptools')
depends=('kealib')
options=(!emptydirs)
source=("https://bitbucket.org/chchrsc/kealib/downloads/kealib-1.4.7.tar.gz")
sha256sums=('ec38751b3b555d3a26f0c7445f2d2cd9d7c3a3502237519a206a50cb58df56ec')

build() {
  cd "$srcdir"/kealib-1.4.7/trunk/python
  python setup.py build
}

package() {
  cd "$srcdir"/kealib-1.4.7/trunk/python
  python setup.py install --root="$pkgdir/" --skip-build
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
