# Maintainer: Johannes Dewender   arch at JonnyJD dot net
pkgname=isrcsubmit
pkgver=2.0.1
pkgrel=1
pkgdesc="submit ISRCs from disc to MusicBrainz"
arch=('any')
url="http://jonnyjd.github.io/musicbrainz-isrcsubmit/"
license=('GPL3')
depends=("python" "python-musicbrainzngs>=0.4" "python-discid>=1.0.0")
makedepends=()
conflicts=()
optdepends=(
"python-keyring: storing login information"
"cdrdao: read ISRCs also from CD-Text"
)
options=(!emptydirs)
source=(http://isrcsubmit.jonnyjd.net/downloads/isrcsubmit-$pkgver.tar.gz)
md5sums=('59399e07a6c90da1a36da9f848909da5')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py test
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --skip-build --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
