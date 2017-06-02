# Maintainer: Ainola

pkgname=gtk-theme-adwaita-tweaks-git
pkgver=r31.2ff12ea
pkgrel=2
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
  install -dm755 "$pkgdir/usr/share/themes/Adwaita Tweaks"
  rm -rf "$srcdir"/adwaita-tweaks/{COPYING,README.md}
  cp -r "$srcdir"/adwaita-tweaks/* "$pkgdir/usr/share/themes/Adwaita Tweaks"
  find "$pkgdir/usr/share/themes/" -type d -exec chmod 755 {} \;
  find "$pkgdir/usr/share/themes/" -type f -exec chmod 644 {} \;
}

# vim: ts=2 sw=2 et
