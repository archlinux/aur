# Maintainer: Johannes Dewender   arch at JonnyJD dot net
_python=python
pkgname=isrcsubmit
pkgver=2.0.1
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
md5sums=('59399e07a6c90da1a36da9f848909da5')

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
