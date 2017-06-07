# Maintainer: Ainola

pkgname=gtk-theme-adwaita-tweaks
pkgver=1.2
pkgrel=1
pkgdesc="Tweaks to improve the default GNOME experience."
arch=(any)
url="https://github.com/Jazqa/adwaita-tweaks"
license=('GPL3')
source=("adwaita-tweaks-$pkgver"::"https://github.com/Jazqa/adwaita-tweaks/releases/download/v$pkgver/adwaita-tweaks.tar.xz"
        "adwaita-tweaks-dark-$pkgver"::"https://github.com/Jazqa/adwaita-tweaks/releases/download/v$pkgver/adwaita-tweaks-dark.tar.xz")
sha256sums=('7c076c4863ebbe024d5f56d17cab2e7be402f5b1a25f7710193185811152ceab'
            'c975c6d9b8f3c21b75cd52d2a53de692bc04610245a697f54d032a61a190f650')

package() {
  install -dm755 "$pkgdir/usr/share/themes/Adwaita Tweaks"
  install -dm755 "$pkgdir/usr/share/themes/Adwaita Tweaks Dark"
  rm -rf "$srcdir"/adwaita-tweaks{,-dark}/{COPYING,README.md}
  cp -r "$srcdir"/adwaita-tweaks/* "$pkgdir/usr/share/themes/Adwaita Tweaks"
  cp -r "$srcdir"/adwaita-tweaks-dark/* "$pkgdir/usr/share/themes/Adwaita Tweaks Dark"
  find "$pkgdir/usr/share/themes/" -type d -exec chmod 755 {} \;
  find "$pkgdir/usr/share/themes/" -type f -exec chmod 644 {} \;
}

# vim: ts=2 sw=2 et
