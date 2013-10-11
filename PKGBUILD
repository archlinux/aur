# Maintainer: Johannes Dewender   arch at JonnyJD dot net
_python=python
pkgname=isrcsubmit
pkgver=2.0.0_beta.5
_pkgver=2.0.0-beta.5
pkgrel=1
pkgdesc="submit ISRCs from disc to MusicBrainz"
arch=('any')
url="https://github.com/JonnyJD/musicbrainz-isrcsubmit"
license=('GPL3')
depends=("$_python" "$_python-musicbrainzngs>=0.4" "$_python-discid>=1.0.0")
makedepends=()
conflicts=()
options=(!emptydirs)
source=(http://isrcsubmit.jonnyjd.net/downloads/isrcsubmit-$_pkgver.tar.gz)
md5sums=('f39a92a131de7ac6b08c508182fd9cc4')

build() {
  cd "$srcdir/$pkgname-$_pkgver"
  $_python setup.py build
}
package() {
  cd "$srcdir/$pkgname-$_pkgver"
  $_python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
