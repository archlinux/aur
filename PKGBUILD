# Based on: https://aur.archlinux.org/packages/gnome-shell-extension-clipboard-indicator
# Maintainer: Ľubomír 'the-k' Kučera <lubomir.kucera.jr at gmail.com>
_pkgname=gnome-shell-extension-clipboard-indicator
_uuid=("clipboard-indicator@tudmotu.com")
pkgname="${_pkgname}-lubo"
pkgver=64
pkgrel=1
pkgdesc="The most popular clipboard manager for GNOME, always up-to-date"
arch=("any")
url="https://github.com/Tudmotu/gnome-shell-extension-clipboard-indicator"
license=("MIT")
depends=("gnome-shell>=46.0")
conflicts=(
  "${_pkgname}"
  "gnome-shell-extension-clipboard-history"
)
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=('4dcebbfc3b85598c4c05f9bcd4895c87')

package() {
  install -d "$pkgdir/usr/share/gnome-shell/extensions" \
    && cp -a "$srcdir/$_pkgname-$pkgver/." "$_/$_uuid"

  install -d "$pkgdir/usr/share/glib-2.0" \
    && cp -a "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/schemas" "$_"

  rm -f "$pkgdir/usr/share/glib-2.0/schemas/gschemas.compiled"
}
