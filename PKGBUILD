# Maintainer:  Tyler Swagar <buttpickle69@shaw.ca>
# Contributor: Federico Cinelli <cinelli@aur.archlinux.org>
# Contributor: Chris Brannon <chris@the-brannons.com>
# Contributor  Sarah Hay <sarahhay@mb.sympatico.ca>

pkgname=cddb_get
_realname=CDDB_get
pkgver=2.28
pkgrel=6
pkgdesc="Fetches CDDB info for an audio cd."
arch=('any')
url="https://web.archive.org/web/20190628161057/http://armin.emx.at/cddb/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/F/FO/FONKIE/$_realname-$pkgver.tar.gz")
md5sums=('e757e5e2f5a4c4aafcce0529310f2c6d')
sha1sums=('20320871553b63b60a95776053aaadd5c2f508eb')

build() {
  cd "$srcdir/$_realname-$pkgver"

  # install module in vendor directories.
  perl Makefile.PL INSTALLDIRS=vendor INSTALLVENDORSCRIPT=/usr/bin

  make
}

package() {
  cd "$srcdir/$_realname-$pkgver"

  make DESTDIR="$pkgdir" install
}
