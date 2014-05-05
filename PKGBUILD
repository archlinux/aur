# Maintainer: Johannes Dewender   arch at JonnyJD dot net
_python=python
pkgname=isrcsubmit
pkgver=2.0.0
pkgrel=1
pkgdesc="submit ISRCs from disc to MusicBrainz"
arch=('any')
url="https://github.com/JonnyJD/musicbrainz-isrcsubmit"
license=('GPL3')
depends=("$_python" "$_python-musicbrainzngs>=0.4" "$_python-discid>=1.0.0")
makedepends=()
conflicts=()
options=(!emptydirs)
source=(http://isrcsubmit.jonnyjd.net/downloads/isrcsubmit-$pkgver.tar.gz)
md5sums=('8f77736bf3dccb61abd9b65ac5cc086e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  $_python setup.py build
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  $_python setup.py test
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  $_python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
