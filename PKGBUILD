# Maintainer: Ainola

pkgname=gtk-theme-minwaita
pkgver=1.3
pkgrel=1
pkgdesc="A tweaked, more compact version of Adwaita."
arch=(any)
url="https://github.com/godlyranchdressing/Minwaita"
license=('GPL')
# Upstream doesn't actually do releases and just pushes an update to the
# tarball in the repo. Using a specific revision keeps this package working.
# https://www.gnome-look.org/p/1174686/ shows the release numbers.
source=("minwaita-$pkgver.tar.gz"::"https://github.com/godlyranchdressing/Minwaita/raw/5f36d7685e3655bc37ca84e58c84eea7f2a7b763/Minwaita-Latest.tar.gz")
sha256sums=('9a9419ad1e085d3e1cbc75b490309dc91e6bcb892ea97a16b114746404ac2be8')

package() {
  install -dm755 "$pkgdir/usr/share/themes"
  cp -r "$srcdir"/Minwaita-Latest/Minwaita "$pkgdir/usr/share/themes/"
  cp -r "$srcdir"/Minwaita-Latest/Minwaita-Dark "$pkgdir/usr/share/themes/"
  cp -r "$srcdir"/Minwaita-Latest/Minwaita-Light "$pkgdir/usr/share/themes/"
  find "$pkgdir/usr/share/themes/" -type d -exec chmod 755 {} \;
  find "$pkgdir/usr/share/themes/" -type f -exec chmod 644 {} \;
}

# vim: ts=2 sw=2 et
