# Maintainer: Nabobalis <nabil dot freij at gmail dot com>
# Contributor: Nabobalis <nabil dot freij at gmail dot com>
pkgname=python-sunpy
pkgver=0.7.9
pkgrel=1
pkgdesc="Python library for solar physics"
arch=('i686' 'x86_64')
url="http://www.sunpy.org/"
license=('BSD')
depends=('python'
         'python-astropy'
         'python-matplotlib'
         'python-scipy'
         'python-pandas'
         'python-requests'
         'python-suds-jurko'
         'python-beautifulsoup4')
optdepends=('python-sqlalchemy: for the database package'
            'python-pytest: for running tests')
options=(!emptydirs)
source=(https://pypi.io/packages/source/s/sunpy/sunpy-$pkgver.tar.gz)
md5sums=('a1c6cec0d4606527075b5717dbf2108b')

package(){
  cd $srcdir/sunpy-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 ${srcdir}/sunpy-$pkgver/licenses/SUNPY.rst ${pkgdir}/usr/share/licenses/python-sunpy
}

# vim:set ts=2 sw=2 et:
