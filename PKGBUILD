# Maintainer: Johannes Dewender   arch at JonnyJD dot net
_python=python
pkgname=isrcsubmit
pkgver=2.0.0_rc.1
_pkgver=2.0.0-rc.1
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
md5sums=('32d6c695d5cd65cfbd69aad0bf1c0d5b')

build() {
  cd "$srcdir/$pkgname-$_pkgver"
  $_python setup.py build
}

check() {
  cd "$srcdir/$pkgname-$_pkgver"
  $_python setup.py test
}

package() {
  cd "$srcdir/$pkgname-$_pkgver"
  $_python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
