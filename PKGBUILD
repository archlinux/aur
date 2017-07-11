# Maintainer: Ainola

pkgname=gtk-theme-adwaita-tweaks
pkgver=1.3
pkgrel=1
pkgdesc="Tweaks to improve the default GNOME experience."
arch=(any)
url="https://github.com/Jazqa/adwaita-tweaks"
license=('GPL3')
source=("adwaita-tweaks-$pkgver"::"https://github.com/Jazqa/adwaita-tweaks/releases/download/v$pkgver/adwaita-tweaks.tar.gz"
        "adwaita-tweaks-dark-$pkgver"::"https://github.com/Jazqa/adwaita-tweaks/releases/download/v$pkgver/adwaita-tweaks-dark.tar.gz")
sha256sums=('aef0e8e843856b6168f31ed8213d39af306a95b9d8d5320f2af07ce62f133ffc'
            '7313d54678d57bb9018910bafc03cc4fec03fc804156cac626a9e4886230d270')

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
