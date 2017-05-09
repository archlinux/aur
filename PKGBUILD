# Maintainer: Ainola

pkgname=gtk-theme-united-gnome
pkgver=2.0
pkgrel=1
epoch=1
pkgdesc="Based on a Ubuntu 18.04 design concept Flat-Plat as a base."
arch=(any)
url="https://github.com/godlyranchdressing/United-GNOME"
license=('GPL3')
source=("https://github.com/godlyranchdressing/United-GNOME/releases/download/V$pkgver/United-Latest.tar.gz"
        "https://github.com/godlyranchdressing/United-GNOME/releases/download/V$pkgver/United-Latest-Fedora.tar.gz")
sha256sums=('28508e0b0e55b5e5d7c05d1e0ec59b64a04d4e3a85a76bb93e5fb0a107fc3875'
            'd5c9e6ff30d35fdbe3bc1373dff1723e218735a92252be2b6ef885c8229a0b3b')

package() {
  install -dm755 "$pkgdir/usr/share/themes"
  find "$srcdir" -iname readme.md -exec rm {} \;
  cp -r "$srcdir"/United-Latest-Ubuntu/* "$pkgdir/usr/share/themes/"
  cp -r "$srcdir"/United-Latest-Fedora/* "$pkgdir/usr/share/themes/"
  find "$pkgdir/usr/share/themes/" -type d -exec chmod 755 {} \;
  find "$pkgdir/usr/share/themes/" -type f -exec chmod 644 {} \;
}

# vim: ts=2 sw=2 et
