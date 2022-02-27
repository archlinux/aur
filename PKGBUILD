# Maintainer: loh.tar <loh.tar at googlemail dot com>
pkgname='tbsm'
pkgver='0.6'
pkgrel='1'
pkgdesc='A pure bash session or application launcher. Inspired by cdm, tdm and krunner.'
arch=('any')
url='https://github.com/loh-tar/tbsm'
license=('GPL')
depends=('bash')
install="$pkgname.install"
changelog="release-notes.txt"
source=("$pkgname-$pkgver.tar.gz::https://github.com/loh-tar/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('1ed6f5c39d5394374529cc5b820f9cc6c5aaad8e8d0ce6098bdb16780acd117f')

prepare() {
  # Update/Copy/Fetch release-notes/changelog It's not possible to referenz above direct
  cp "$pkgname-$pkgver/doc/80_ReleaseNotes.txt" ../release-notes.txt
}

package() {
  cd "$pkgname-$pkgver"
  make install DESTDIR="$pkgdir"
}
