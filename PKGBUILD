# Maintainer: Ainola

pkgname=gtk-theme-minwaita-osx
pkgver=1.3.1
pkgrel=1
pkgdesc="A tweaked, more compact version of Adwaita (OS X window buttons)."
arch=(any)
url="https://github.com/godlyranchdressing/Minwaita"
license=('GPL')
source=("https://github.com/godlyranchdressing/Minwaita/releases/download/v$pkgver/Minwaita-OSX.tar.gz")
# The file names conflict with each other
conflicts=('gtk-theme-minwaita' 'gtk-theme-minwaita-vanilla')
sha256sums=('646e92239aa403698eb5a5556c03c25b4b823e3cf631f69588bd7b4b95074997')

package() {
  install -dm755 "$pkgdir/usr/share/themes"
  cp -r "$srcdir"/Minwaita-OSX "$pkgdir/usr/share/themes/"
  cp -r "$srcdir"/Minwaita-Dark-OSX "$pkgdir/usr/share/themes/"
  cp -r "$srcdir"/Minwaita-Light-Shell "$pkgdir/usr/share/themes/"
  find "$pkgdir/usr/share/themes/" -type d -exec chmod 755 {} \;
  find "$pkgdir/usr/share/themes/" -type f -exec chmod 644 {} \;
}

# vim: ts=2 sw=2 et
