# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=gnome-shell-extension-clipboard-indicator
_uuid=("clipboard-indicator@tudmotu.com")
pkgver=66
pkgrel=1
pkgdesc="Adds a clipboard indicator to the top panel, and caches clipboard history"
arch=("any")
url="https://github.com/Tudmotu/gnome-shell-extension-clipboard-indicator"
license=("MIT")
depends=("gnome-shell>=46.0")
conflicts=("gnome-shell-extension-clipboard-history")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b0deb7ae984d7c48c351d9d4dd3ad398b495620934b8b3ba2067c26bd3c4bba8')

package() {
  install -d "$pkgdir/usr/share/gnome-shell/extensions" \
    && cp -a "$srcdir/$pkgname-$pkgver/." "$_/$_uuid"

  install -d "$pkgdir/usr/share/glib-2.0" \
    && cp -a "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/schemas" "$_"

  rm -f "$pkgdir/usr/share/glib-2.0/schemas/gschemas.compiled"
}
