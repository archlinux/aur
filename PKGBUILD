# Maintainer: Ainola

pkgname=gtk-theme-adwaita-tweaks
pkgver=1.5
pkgrel=2
pkgdesc="Tweaks to improve the default GNOME experience."
arch=(any)
url="https://github.com/Jazqa/adwaita-tweaks"
license=('GPL3')
source=("adwaita-tweaks-$pkgver.zip::https://github.com/Jazqa/adwaita-tweaks/releases/download/v$pkgver/adwaita-tweaks.zip"
        "adwaita-tweaks-dark-$pkgver.zip::https://github.com/Jazqa/adwaita-tweaks/releases/download/v$pkgver/adwaita-tweaks-dark.zip")
sha256sums=('b659f99f3af86f5e10a10d6ec83fdd7c11b4919f28ceb514ecda0a060912c9ff'
            '8966bb7c08e400f2770393a78eb75d8e27736fb165cf39e3550861c1f69f0e1c')

package() {
    install -Dm644 "Adwaita Tweaks/README.md" -t "$pkgdir/usr/share/doc/$pkgname/"
    rm -f "Adwaita Tweaks"{,Dark}/{COPYING,README.md}
    install -dm755 "$pkgdir/usr/share/themes/Adwaita Tweaks"
    install -dm755 "$pkgdir/usr/share/themes/Adwaita Tweaks Dark"
    cp -r "Adwaita Tweaks/"* "$pkgdir/usr/share/themes/Adwaita Tweaks"
    cp -r "Adwaita Tweaks Dark/"* "$pkgdir/usr/share/themes/Adwaita Tweaks Dark"
    find "$pkgdir/usr/share/themes/" -type d -exec chmod 755 {} \;
    find "$pkgdir/usr/share/themes/" -type f -exec chmod 644 {} \;
}
