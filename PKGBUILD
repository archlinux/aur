# Maintainer: David Vogt <dave at winged dot ch>
# This PKGBUILD is maintained at https://github.com/winged/aur-packages

pkgname=fahrplan
pkgver=0.2.3
pkgrel=1
pkgdesc="A SBB/CFF/FFS (Swiss railway) commandline based timetable client"
url="https://github.com/dbrgn/fahrplan"
depends=('python' 'python-six' 'python-dateutil' 'python-requests')
makedepends=('python3' )
license=('GPLv3')
arch=('any')
source=('https://pypi.python.org/packages/source/f/fahrplan/fahrplan-0.2.3.tar.gz')
md5sums=('6121f1d2fc16d4b9472ddacdef3f8421')

if [ -n "$VIRTUAL_ENV" ]; then
  echo "Warning: You're building within a virtualenv. Use"
  echo "a shell without virtualenv to build this package!"
  exit 1
fi


build() {
    cd $srcdir/fahrplan-0.2.3
    python setup.py build
}

package() {
    cd $srcdir/fahrplan-0.2.3
    python setup.py install --root="$pkgdir" --optimize=1 
}
