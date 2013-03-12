# Maintainer: Johannes Dewender   arch at JonnyJD dot net
pkgname=isrcsubmit
pkgver=1.0.0
pkgrel=1
pkgdesc="submit ISRCs from disc to MusicBrainz"
arch=('any')
url="https://github.com/JonnyJD/musicbrainz-isrcsubmit"
license=('GPL3')
depends=('python2' 'python2-musicbrainz2>=0.7.0' 'libdiscid')
makedepends=()
conflicts=()
options=(!emptydirs)
source=(http://isrcsubmit.jonnyjd.net/downloads/isrcsubmit-$pkgver.tar.gz)
md5sums=('ae6814472f52569b219eb7f337886f44')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py build
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
