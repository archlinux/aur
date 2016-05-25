# Maintainer: Nabobalis <nabil dot freij at gmail dot com>
# Contributor: Nabobalis <nabil dot freij at gmail dot com>
pkgname=python2-sunpy
pkgver=0.7
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
source=(https://pypi.python.org/packages/75/50/032940aa62a106a5bb0edacc49cfdb9b52ae0e79f6d7b37ca86087dd4580/sunpy-$pkgver.tar.gz)
md5sums=('522b43ad225758e67cb9ba160b54cc2f')

package(){
  cd $srcdir/sunpy-$pkgver
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 ${srcdir}/sunpy-$pkgver/licenses/SUNPY.rst ${pkgdir}/usr/share/licenses/python2-sunpy
}

# vim:set ts=2 sw=2 et:
