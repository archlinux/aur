# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Adrian Sampson <adrian@radbox.org>

pkgname=python-musicbrainzngs-git
_name=musicbrainzngs
pkgver=0.5_86.g98b6885
pkgrel=1
pkgdesc="bindings for the MusicBrainz NGS web service (WS/2)"
url="http://python-musicbrainzngs.readthedocs.org/"
license="BSD"
arch=('any')
makedepends=('git' 'python')
source=('git+https://github.com/alastair/python-musicbrainzngs.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/python-musicbrainzngs"
  git describe --tags | sed -e 's/^v//' -e 's/-/_/' -e 's/-/\./g'
}

check() {
  cd "$srcdir/python-musicbrainzngs"
  python setup.py test
}

package() {
  depends=("python")
  provides=("python-musicbrainzngs=$pkgver")
  conflicts=("python-musicbrainzngs")
  cd "$srcdir/python-musicbrainzngs"
  python setup.py install --root=$pkgdir
}

# vim:set ts=2 sw=2 et:
