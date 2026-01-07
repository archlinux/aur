# Maintainer: B00merang-Artwork
# AUR Mentainer PharmaRacist
pkgname=noon-xp-icons
pkgver=1.0.0
pkgrel=1
pkgdesc="B00merang-Artwork icon theme packaged for Noon Project"
arch=('any')
url="https://github.com/B00merang-Artwork/Windows-XP"
license=('MIT')
depends=('gtk-update-icon-cache')
install=noon-xp-icons.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Install icon theme to /usr/share/icons
  install -dm755 "$pkgdir/usr/share/icons"
  cp -r noon-xp "$pkgdir/usr/share/icons/"

  # Install license if it exists
  if [ -f LICENSE ]; then
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi

  # Install README if it exists
  if [ -f README.md ]; then
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  fi
}
