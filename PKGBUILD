# Maintainer: Nabobalis <nabil dot freij at gmail dot com>
# Contributor: Nabobalis <nabil dot freij at gmail dot com>
pkgname=python2-sunpy
pkgver=0.7.4
pkgrel=1
pkgdesc="Python library for solar physics"
arch=('i686' 'x86_64')
url="http://www.sunpy.org/"
license=('BSD')
depends=('python2'
         'python2-astropy'
         'python2-matplotlib'
         'python2-scipy'
         'python2-pandas'
         'python2-requests'
         'python2-suds'
         'python2-beautifulsoup4')
optdepends=('python2-sqlalchemy: for the database package'
            'python2-pytest: for running tests')
options=(!emptydirs)
source=(https://pypi.python.org/packages/e5/2f/c194ab54af82868e4d72b2a5fc48f31372557048c269bfa2966a53194fdb/sunpy-$pkgver.tar.gz)
md5sums=('b6e549045cd4e807556b6cc1eb9f2cb1')

package(){
  cd $srcdir/sunpy-$pkgver
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 ${srcdir}/sunpy-$pkgver/licenses/SUNPY.rst ${pkgdir}/usr/share/licenses/python2-sunpy
}

# vim:set ts=2 sw=2 et:
