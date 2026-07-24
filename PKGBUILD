# Maintainer: Mazhar Hussain <realmazharhussain@gmail.com>
pkgname=notify-gnome-shell-update
pkgdesc="Get a notification when GNOME Shell has updates available"
pkgver=1.2
pkgrel=1
arch=(any)
license=(GPL-3.0-or-later)
depends=(nvchecker jq libnotify)
source=(
  "gnome-shell-archpkg.toml"
  "notify-gnome-shell-update.desktop"
  "notify-gnome-shell-update.sh"
)
sha256sums=(
  33562c39c0c1c165e1b68670fe0e08cebb039f3bcd6affdc13a267f365b3993c
  847095e136588cd63e0ac83043d0c3ba553155b9a9ad9d1e832dbd12dc579f22
  71561ffd852258eda5a00cbd91ab6c7ba8809038aabfaf69b0374eda7c0b263a
)

package() {
  pkgdatadir="$pkgdir/usr/share/$pkgname"
  pkgbindir="$pkgdir/usr/bin"
  pkgstartdir="$pkgdir/etc/xdg/autostart"
  mkdir -p "$pkgdatadir" "$pkgbindir" "$pkgstartdir"
  cp -t "$pkgdatadir" "gnome-shell-archpkg.toml"
  cp -t "$pkgbindir" "notify-gnome-shell-update.sh"
  cp -t "$pkgstartdir" "notify-gnome-shell-update.desktop"
}

