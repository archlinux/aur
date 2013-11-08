# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Adrian Sampson <adrian@radbox.org>

_python=python2
_name=musicbrainzngs

pkgname=$_python-$_name-git
pkgver=0.4_30.g33890d0
pkgrel=1
pkgdesc="bindings for the MusicBrainz NGS service"
url="http://python-musicbrainzngs.readthedocs.org/"
license="BSD"
arch=('any')
depends=("$_python")
makedepends=("$_python-distribute" 'git')
provides=("$_python-musicbrainzngs=$pkgver")
conflicts=("$_python-musicbrainzngs")
source=('git+https://github.com/alastair/python-musicbrainzngs.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/python-musicbrainzngs"
  git describe --tags | sed -e 's/^v//' -e 's/-/_/' -e 's/-/\./g'
}

build() {
  cd "$srcdir/python-musicbrainzngs"
  $_python setup.py build
}

check() {
  cd "$srcdir/python-musicbrainzngs"
  $_python setup.py test
}

package() {
  cd "$srcdir/python-musicbrainzngs"
  $_python setup.py install --root=$pkgdir
}

# vim:set ts=2 sw=2 et:
