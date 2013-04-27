# Maintainer: Johannes Dewender   arch at JonnyJD dot net
_python=python
pkgname=isrcsubmit
pkgver=2.0.0_beta.2
_pkgver=2.0.0-beta.2
pkgrel=1
pkgdesc="submit ISRCs from disc to MusicBrainz"
arch=('any')
url="https://github.com/JonnyJD/musicbrainz-isrcsubmit"
license=('GPL3')
depends=("$_python" "$_python-musicbrainzngs" "$_python-discid>=0.5.0")
makedepends=()
conflicts=()
options=(!emptydirs)
source=(http://isrcsubmit.jonnyjd.net/downloads/isrcsubmit-$_pkgver.tar.gz)
md5sums=('5731b74c26e00178879f1f31680b0ee9')

build() {
  cd "$srcdir/$pkgname-$_pkgver"
  $_python setup.py build
}
package() {
  cd "$srcdir/$pkgname-$_pkgver"
  $_python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
