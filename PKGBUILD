# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-dynamic-calendar-and-clocks-icons-reborn
 _uuid=dynamic-calendar-and-clocks-icons-reborn@thecalamityjoe87.github.com
pkgver=4
pkgrel=1
pkgdesc="Let Calendar, Clocks and Weather icons show current date, time and weather."
arch=('any')
url="https://github.com/thecalamityjoe87/dynamic-calendar-and-clocks-icons-reborn"
license=('GPL-3.0-or-later')
depends=('gnome-shell')
provides=('gnome-shell-extension-dynamic-calendar-and-clocks-icons')
conflicts=('gnome-shell-extension-dynamic-calendar-and-clocks-icons')
source=("dynamic-calendar-and-clocks-icons-reborn-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7fd800aafee5c4fe5807b12f95c77cc599428acc9ab967350545f6d0086ca715')

package() {
  cd "dynamic-calendar-and-clocks-icons-reborn-$pkgver"
  install -d "$pkgdir/usr/share/gnome-shell/extensions"
  cp -r ${_uuid} "$pkgdir/usr/share/gnome-shell/extensions/"

  mv -v "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/locale" "$pkgdir/usr/share"

  install -Dvm644 "${_uuid}"/schemas/*.gschema.xml -t "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rfv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas"
}
