# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=gnome-shell-extension-clipboard-indicator
_uuid=("clipboard-indicator@tudmotu.com")
pkgver=68
pkgrel=1
pkgdesc="Adds a clipboard indicator to the top panel, and caches clipboard history"
arch=("any")
url="https://github.com/Tudmotu/gnome-shell-extension-clipboard-indicator"
license=("MIT")
depends=("gnome-shell>=46.0")
conflicts=("gnome-shell-extension-clipboard-history")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('68671085f4bbd9c5de1e18de3a42f8475b82a7c9850783aba59be6636b1952f8')

package() {
  install -d "$pkgdir/usr/share/gnome-shell/extensions" \
    && cp -a "$srcdir/$pkgname-$pkgver/." "$_/$_uuid"

  install -d "$pkgdir/usr/share/glib-2.0" \
    && cp -a "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/schemas" "$_"

  rm -f "$pkgdir/usr/share/glib-2.0/schemas/gschemas.compiled"
}
