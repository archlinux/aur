# Maintainer: Ainola

pkgname=gtk-theme-adwaita-tweaks
pkgver=1.5
pkgrel=1
pkgdesc="Tweaks to improve the default GNOME experience."
arch=(any)
url="https://github.com/Jazqa/adwaita-tweaks"
license=('GPL3')
source=("adwaita-tweaks-$pkgver"::"https://github.com/Jazqa/adwaita-tweaks/releases/download/v$pkgver/adwaita-tweaks.zip"
        "adwaita-tweaks-dark-$pkgver"::"https://github.com/Jazqa/adwaita-tweaks/releases/download/v$pkgver/adwaita-tweaks-dark.zip")
sha256sums=('b659f99f3af86f5e10a10d6ec83fdd7c11b4919f28ceb514ecda0a060912c9ff'
            '8966bb7c08e400f2770393a78eb75d8e27736fb165cf39e3550861c1f69f0e1c')

package() {
  install -dm755 "$pkgdir/usr/share/themes/Adwaita Tweaks"
  install -dm755 "$pkgdir/usr/share/themes/Adwaita Tweaks Dark"
  rm -rf "$srcdir/Adwaita Tweaks"/{COPYING,README.md}
  rm -rf "$srcdir/Adwaita Tweaks Dark"/{COPYING,README.md}
  cp -r "$srcdir/Adwaita Tweaks/"* "$pkgdir/usr/share/themes/Adwaita Tweaks"
  cp -r "$srcdir/Adwaita Tweaks Dark/"* "$pkgdir/usr/share/themes/Adwaita Tweaks Dark"
  find "$pkgdir/usr/share/themes/" -type d -exec chmod 755 {} \;
  find "$pkgdir/usr/share/themes/" -type f -exec chmod 644 {} \;
}

# vim: ts=2 sw=2 et
