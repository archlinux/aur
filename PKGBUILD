# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Adrian Sampson <adrian@radbox.org>

_python=python2
_name=musicbrainzngs

pkgname=$_python-$_name-git
pkgver=0.3_3.g41236df
pkgrel=1
pkgdesc="bindings for the MusicBrainz NGS service"
url="https://github.com/alastair/python-musicbrainz-ngs"
license="BSD"
arch=('any')
depends=("$_python")
makedepends=("$_python-distribute" 'git')
provides=("$_python-musicbrainzngs=0.3")
conflicts=("$_python-musicbrainzngs")
source=('git+https://github.com/alastair/python-musicbrainz-ngs.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/python-musicbrainz-ngs"
  git describe --tags | sed -e 's/^v//' -e 's/-/_/' -e 's/-/\./g'
}

build() {
  cd "$srcdir/python-musicbrainz-ngs"
  $_python setup.py build
}

check() {
  cd "$srcdir/python-musicbrainz-ngs"
  $_python setup.py test
}

package() {
  cd "$srcdir/python-musicbrainz-ngs"
  $_python setup.py install --root=$pkgdir
}

# vim:set ts=2 sw=2 et:
