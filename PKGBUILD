# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_google_maps
_name=trytond_google_maps
pkgver=5.6.0
_pkgdir=5.6
pkgrel=1
pkgdesc="Tryton module to link addresses to Google Maps"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('8a4c9fa93ea20b9896a0b23bd8ebedb776a24a3f1c8652b2729af0361bf62768
4ff91fffdd061bbdd5c202d581a795e3bfa9fbb94756b6c88b97b523f93f33da')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
