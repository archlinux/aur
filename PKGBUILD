# Maintainer: Johannes Dewender   arch at JonnyJD dot net
pkgname=isrcsubmit
pkgver=0.5.2
pkgrel=2
pkgdesc="submit ISRCs from disc to MusicBrainz"
arch=('any')
url="https://github.com/JonnyJD/musicbrainz-isrcsubmit"
license=('GPL3')
depends=('python2' 'python2-musicbrainz2>=0.7.0' 'libdiscid')
makedepends=()
conflicts=()
options=(!emptydirs)
source=(http://isrcsubmit.jonnyjd.net/downloads/isrcsubmit-$pkgver.tar.gz)
md5sums=('3e79b878d55e82125197069bc292d50c')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py build
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
