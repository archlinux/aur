# Maintainer: loh.tar <loh.tar at googlemail dot com>
pkgname='tbsm'
pkgver='0.7'
pkgrel='1'
pkgdesc='A pure bash session or application launcher. Inspired by cdm, tdm and krunner.'
arch=('any')
url='https://github.com/loh-tar/tbsm'
license=('GPL')
depends=('bash')
install="$pkgname.install"
changelog="release-notes.txt"
source=("$pkgname-$pkgver.tar.gz::https://github.com/loh-tar/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('fc67d6ce6efe7c4d51d16c29ddb2f96e675a20262d2c7b3ed9b8c808536eca32')

prepare() {
  # Update/Copy/Fetch release-notes/changelog It's not possible to referenz above direct
  cp "$pkgname-$pkgver/doc/80_ReleaseNotes.txt" ../release-notes.txt
}

package() {
  cd "$pkgname-$pkgver"
  make install DESTDIR="$pkgdir"
}
