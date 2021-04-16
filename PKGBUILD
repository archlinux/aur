# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=gnome-shell-extension-clipboard-indicator
_uuid=("clipboard-indicator@tudmotu.com")
pkgver=38
pkgrel=2
pkgdesc="Adds a clipboard indicator to the top panel, and caches clipboard history"
arch=("any")
url="https://github.com/Tudmotu/gnome-shell-extension-clipboard-indicator"
license=("GPL")
depends=("gnome-shell")
conflicts=("gnome-shell-extension-clipboard-indicator-git")
source=("$pkgname-$pkgver.zip::https://extensions.gnome.org/extension-data/clipboard-indicatortudmotu.com.v$pkgver.shell-extension.zip")
md5sums=("42ae61293b257275a41658478c735c38")

package() {
  install -d "$pkgdir/usr/share/gnome-shell/extensions" && cp -a "$srcdir/." "$_/$_uuid"
  install -d "$pkgdir/usr/share/glib-2.0" && cp -a "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/schemas" "$_"

  install -Dm755 "$srcdir/metadata.json" "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/metadata.json"

  rm -f "$pkgdir/usr/share/glib-2.0/schemas/gschemas.compiled"
  rm -f "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/$pkgname-$pkgver.zip"
}
