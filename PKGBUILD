# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_timesheet
_name=trytond_timesheet
pkgver=5.2.0
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module with timesheets"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('be642a4cf406a182b66df950df239750f0deb62cd1581d063a403b939198956e')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
