# Maintainer: Ainola

pkgname=gtk-theme-minwaita
pkgver=1.3.1
pkgrel=2
pkgdesc="A tweaked, more compact version of Adwaita."
arch=(any)
url="https://github.com/godlyranchdressing/Minwaita"
license=('GPL')
source=("https://github.com/godlyranchdressing/Minwaita/releases/download/v$pkgver/Minwaita.tar.gz"
        "https://github.com/godlyranchdressing/Minwaita/releases/download/v$pkgver/Minwaita-OSX.tar.gz"
        "https://github.com/godlyranchdressing/Minwaita/releases/download/v$pkgver/Minwaita-Vanilla.tar.gz")
sha256sums=('9455193751803042b1510d0887497c41153e656cf3e089e1cb887322761e1187'
            '646e92239aa403698eb5a5556c03c25b4b823e3cf631f69588bd7b4b95074997'
            '539f4a23d6e5a15fccfbcf089f2f969c6e0fc7ef16f490527e7c1fdd145526e8')

package() {
  install -dm755 "$pkgdir/usr/share/themes"
  cp -r "$srcdir"/Minwaita "$pkgdir/usr/share/themes/"
  cp -r "$srcdir"/Minwaita-Dark "$pkgdir/usr/share/themes/"
  cp -r "$srcdir"/Minwaita-OSX "$pkgdir/usr/share/themes/"
  cp -r "$srcdir"/Minwaita-Dark-OSX "$pkgdir/usr/share/themes/"
  cp -r "$srcdir"/Minwaita-Vanilla "$pkgdir/usr/share/themes/"
  cp -r "$srcdir"/Minwaita-Dark-Vanilla "$pkgdir/usr/share/themes/"
  # All three packages share the same Light shell theme (the only difference
  # between all of these packages are the window controls.
  cp -r "$srcdir"/Minwaita-Light-Shell "$pkgdir/usr/share/themes/"
  find "$pkgdir/usr/share/themes/" -type d -exec chmod 755 {} \;
  find "$pkgdir/usr/share/themes/" -type f -exec chmod 644 {} \;
}

# vim: ts=2 sw=2 et
