# Maintainer: Ainola

pkgname=gtk-theme-united-gnome
pkgver=1.9
pkgrel=1
pkgdesc="Based on a Ubuntu 18.04 design concept Flat-Plat as a base."
arch=(any)
url="https://github.com/godlyranchdressing/United-GNOME"
license=('GPL2')
# Upstream doesn't actually do releases and just pushes an update to the
# tarball in the repo. Using a specific revision keeps this package working.
# https://www.gnome-look.org/p/1174889/ shows the release numbers.
source=("united-gnome-$pkgver.tar.gz"::"https://github.com/godlyranchdressing/United-GNOME/raw/3972f1abd33dca8d4d26c65a0d1a3b6f68a44d7c/United-Latest.tar.gz")

md5sums=('70409be8cea8ff447c8aba9d5257ebdb')

package() {
  install -dm755 "$pkgdir/usr/share/themes"
  find "$srcdir" -iname readme.md -exec rm {} \;
  cp -r "$srcdir"/United-Latest/* "$pkgdir/usr/share/themes/"
  find "$pkgdir/usr/share/themes/" -type d -exec chmod 755 {} \;
  find "$pkgdir/usr/share/themes/" -type f -exec chmod 644 {} \;
}

# vim: ts=2 sw=2 et
