# Maintainer: Ainola

pkgname=gtk-theme-minwaita
pkgver=1.3.1
pkgrel=3
pkgdesc="A tweaked, more compact version of Adwaita."
arch=(any)
url="https://github.com/godlyranchdressing/Minwaita"
license=('GPL')
source=("https://github.com/godlyranchdressing/Minwaita/releases/download/v$pkgver/Minwaita.tar.gz"
        "https://github.com/godlyranchdressing/Minwaita/releases/download/v$pkgver/Minwaita-OSX.tar.gz"
        "https://github.com/godlyranchdressing/Minwaita/releases/download/v$pkgver/Minwaita-Vanilla.tar.gz")
sha256sums=('6d97fa1cd9a0b192bbd45194c7dc6de618f543b1b480009bb73ad33433addd3e'
            '9ac460c18b3b422a7dabb10490f9f60a12f909c38b8704a77bdb9f801046e3ae'
            'fd9f4edd0a5d340d321f16a848f25dd34f2698d206f3f29493697d2f7df8c5de')

package() {
  install -dm755 "$pkgdir/usr/share/themes"
  cp -r "$srcdir"/Minwaita "$pkgdir/usr/share/themes/"
  cp -r "$srcdir"/Minwaita-Dark "$pkgdir/usr/share/themes/"
  cp -r "$srcdir"/Minwaita-OSX "$pkgdir/usr/share/themes/"
  cp -r "$srcdir"/Minwaita-Dark-OSX "$pkgdir/usr/share/themes/"
  cp -r "$srcdir"/Minwaita-Vanilla "$pkgdir/usr/share/themes/"
  cp -r "$srcdir"/Minwaita-Dark-Vanilla "$pkgdir/usr/share/themes/"
  # All three packages share the same Light shell theme (the only difference
  # between all of these packages are the window controls).
  cp -r "$srcdir"/Minwaita-Light-Shell "$pkgdir/usr/share/themes/"
  find "$pkgdir/usr/share/themes/" -type d -exec chmod 755 {} \;
  find "$pkgdir/usr/share/themes/" -type f -exec chmod 644 {} \;
}

# vim: ts=2 sw=2 et
