# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=gnome-shell-extension-clipboard-indicator
_uuid=("clipboard-indicator@tudmotu.com")
pkgver=42
pkgrel=1
pkgdesc="Adds a clipboard indicator to the top panel, and caches clipboard history"
arch=("any")
url="https://github.com/Tudmotu/gnome-shell-extension-clipboard-indicator"
license=("GPL")
depends=("gnome-shell")
conflicts=("gnome-shell-extension-clipboard-indicator-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=('dae1272643552457886adfeb9eed093a')

package() {
  install -d "$pkgdir/usr/share/gnome-shell/extensions" \
    && cp -a "$srcdir/$pkgname-$pkgver/." "$_/$_uuid"

  install -d "$pkgdir/usr/share/glib-2.0" \
    && cp -a "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/schemas" "$_"

  rm -f "$pkgdir/usr/share/glib-2.0/schemas/gschemas.compiled"
}
