# Maintainer: Ainola

pkgname=gtk-theme-adwaita-tweaks
pkgver=1.4
pkgrel=1
pkgdesc="Tweaks to improve the default GNOME experience."
arch=(any)
url="https://github.com/Jazqa/adwaita-tweaks"
license=('GPL3')
source=("adwaita-tweaks-$pkgver"::"https://github.com/Jazqa/adwaita-tweaks/releases/download/v$pkgver/adwaita-tweaks.zip"
        "adwaita-tweaks-dark-$pkgver"::"https://github.com/Jazqa/adwaita-tweaks/releases/download/v$pkgver/adwaita-tweaks-dark.zip")
sha256sums=('2ec2f4110c1a9a45be2ad52430fd79fd52dd64e1192616c3fa500c71c2a52967'
            'ba11e9361a7b24d8af8048904738219ae355da865e2fe7ea1907f412a6e3961e')

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
