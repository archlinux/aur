# Maintainer: Ainola

pkgname=gtk-theme-adwaita-tweaks-git
pkgver=r102.4d6e08e
pkgrel=1
pkgdesc="Tweaks to improve the default GNOME experience."
arch=(any)
url="https://github.com/Jazqa/adwaita-tweaks"
license=('GPL3')
source=('git://github.com/Jazqa/adwaita-tweaks.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir"/adwaita-tweaks
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -Dm644 "adwaita-tweaks/README.md" -t "$pkgdir/usr/share/doc/$pkgname/"
    install -dm755 "$pkgdir/usr/share/themes/Adwaita Tweaks"
    rm -rf adwaita-tweaks/{COPYING,README.md}
    cp -r adwaita-tweaks/* "$pkgdir/usr/share/themes/Adwaita Tweaks"
    find "$pkgdir/usr/share/themes/" -type d -exec chmod 755 {} \;
    find "$pkgdir/usr/share/themes/" -type f -exec chmod 644 {} \;
}
