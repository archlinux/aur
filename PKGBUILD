# Maintainer: Ainola

pkgname=gtk-theme-adwaita-tweaks
pkgver=1.0
pkgrel=1
pkgdesc="Tweaks to improve the default GNOME experience."
arch=(any)
url="https://github.com/Jazqa/adwaita-tweaks"
license=('GPL3')
source=("https://github.com/Jazqa/adwaita-tweaks/releases/download/v$pkgver/adwaita-tweaks.tar.gz"
        "https://github.com/Jazqa/adwaita-tweaks/releases/download/v$pkgver/adwaita-tweaks-dark.tar.gz")
sha256sums=('a0a3cbe7a5f0f618ea54e6034369438db344e629f9a1b6a76fbdb2d27db1c1ac'
            'f15c87f6b9c6cfa2cec3884b76150d2d5c5af2a6b926aa2f21fccfc4e84ed15e')

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
