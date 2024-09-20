# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=gnome-shell-extension-clipboard-indicator
_uuid=("clipboard-indicator@tudmotu.com")
pkgver=64
pkgrel=2
pkgdesc="Adds a clipboard indicator to the top panel, and caches clipboard history"
arch=("any")
url="https://github.com/Tudmotu/gnome-shell-extension-clipboard-indicator"
license=("MIT")
depends=("gnome-shell>=46.0")
conflicts=("gnome-shell-extension-clipboard-history")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('759fae6d9be4b41d410c7eab117667c6aa41415712963624da453d5d4be909b5')

package() {
  install -d "$pkgdir/usr/share/gnome-shell/extensions" \
    && cp -a "$srcdir/$pkgname-$pkgver/." "$_/$_uuid"

  install -d "$pkgdir/usr/share/glib-2.0" \
    && cp -a "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/schemas" "$_"

  rm -f "$pkgdir/usr/share/glib-2.0/schemas/gschemas.compiled"

  sed -i '3s/46/47/' "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/metadata.json"
}
