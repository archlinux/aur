# Maintainer: Johannes Dewender   arch at JonnyJD dot net
pkgname=('python-discid' 'python2-discid')
_pkgname=discid
_python=python
pkgver=1.1.0
pkgrel=2
pkgdesc="Python binding of MusicBrainz libdiscid (Picard optdep)"
arch=('any')
url="https://python-discid.readthedocs.org/"
license=('LGPL3')
depends=('libdiscid>=0.2.2')
makedepends=()
conflicts=()
options=(!emptydirs)
source=(http://pypi.python.org/packages/source/d/$_pkgname/$_pkgname-$pkgver.tar.gz)
md5sums=('2ad2141452dd10b03ad96ccdad075235')

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py test
}

package_python-discid() {
  depends+=('python>=3.1')
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-discid() {
  depends+=('python2>=2.6')
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
