# Maintainer: Ainola

pkgname=gtk-theme-minwaita
pkgver=1.3.3
pkgrel=2
pkgdesc="A tweaked, more compact version of Adwaita."
arch=(any)
url="https://github.com/godlyranchdressing/Minwaita"
license=('GPL')
source=("Minwaita-$pkgver.tar.gz"::"https://github.com/godlyranchdressing/Minwaita/releases/download/V$pkgver/Minwaita.tar.gz"
        "Minwaita-OSX-$pkgver.tar.gz"::"https://github.com/godlyranchdressing/Minwaita/releases/download/V$pkgver/Minwaita-OSX.tar.gz"
        "Minwaita-Vanilla-$pkgver.tar.gz"::"https://github.com/godlyranchdressing/Minwaita/releases/download/V$pkgver/Minwaita-Vanilla.tar.gz")
sha256sums=('56287e321787dbb8e1a7c25dabc2cce864ee144e81075bec46e52de9e298aab8'
            '2f5dc5006359cb022f2b2e0c7735b19e73d46fdff521e8b5f798e3b66a11f72b'
            'bc424b7eb2e6a7bdcb241eb2ccdb4bf9831daf5d888fccc2e4bef03c1fe65a90')

package() {
  install -dm755 "$pkgdir/usr/share/themes"
  # All three packages share the same Light shell theme (the only difference
  # between all of these packages are the window controls).
  cp -r "$srcdir"/Minwaita/* "$pkgdir/usr/share/themes/"
  cp -r "$srcdir"/Minwaita-OSX "$pkgdir/usr/share/themes/"
  cp -r "$srcdir"/Minwaita-Dark-OSX "$pkgdir/usr/share/themes/"
  cp -r "$srcdir"/Minwaita-Vanilla "$pkgdir/usr/share/themes/"
  cp -r "$srcdir"/Minwaita-Dark-Vanilla "$pkgdir/usr/share/themes/"
  find "$pkgdir/usr/share/themes/" -type d -exec chmod 755 {} \;
  find "$pkgdir/usr/share/themes/" -type f -exec chmod 644 {} \;
}

# vim: ts=2 sw=2 et
