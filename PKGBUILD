# Maintainer: Callum Osmotherly <acheronfail@gmail.com>
pkgname=istat-bin
pkgver="0.7.0"
pkgrel=1
pkgdesc="A lightweight and batteries-included status_command for i3 and sway"
arch=('x86_64')
url="https://github.com/acheronfail/istat"
license=('GPL-3.0-only')
depends=('gcc-libs')
optdepends=(
  'dbus: sending notifications'
  'dunst: showing if notifications are paused or not via dunst'
  'i3-wm: use it as the i3 status_command'
)
source=("${pkgname%-bin}-${pkgver}.zip::$url/releases/download/${pkgver}/${pkgname%-bin}-x86_64-unknown-linux-gnu.zip")
sha512sums=('c22062a54bb9383818ffd9f505ef86927017df87cd61b3fb8a4fd58cb61be6fbbe9e26e402a91b2a48b42aa2d1a6794fe330d3e0acadfc1fd23f9267260533c0')

package() {
  cd "${pkgname%-bin}-x86_64-unknown-linux-gnu"

  install -Dm755 "istat"         "$pkgdir/usr/bin/istat"
  install -Dm755 "istat-ipc"     "$pkgdir/usr/bin/istat-ipc"
  install -Dm755 "istat-acpi"    "$pkgdir/usr/bin/istat-acpi"
  install -Dm755 "istat-signals" "$pkgdir/usr/bin/istat-signals"
  install -Dm755 "istat-sensors" "$pkgdir/usr/bin/istat-sensors"

  install -Dm644 "doc/istat.1"                 "$pkgdir/usr/share/man/man1/istat.1"
  install -Dm644 "doc/istat-acpi.1"            "$pkgdir/usr/share/man/man1/istat-acpi.1"
  install -Dm644 "doc/istat-ipc.1"             "$pkgdir/usr/share/man/man1/istat-ipc.1"
  install -Dm644 "doc/istat-ipc-click.1"       "$pkgdir/usr/share/man/man1/istat-ipc-click.1"
  install -Dm644 "doc/istat-ipc-custom.1"      "$pkgdir/usr/share/man/man1/istat-ipc-custom.1"
  install -Dm644 "doc/istat-ipc-get-bar.1"     "$pkgdir/usr/share/man/man1/istat-ipc-get-bar.1"
  install -Dm644 "doc/istat-ipc-get-config.1"  "$pkgdir/usr/share/man/man1/istat-ipc-get-config.1"
  install -Dm644 "doc/istat-ipc-get-theme.1"   "$pkgdir/usr/share/man/man1/istat-ipc-get-theme.1"
  install -Dm644 "doc/istat-ipc-info.1"        "$pkgdir/usr/share/man/man1/istat-ipc-info.1"
  install -Dm644 "doc/istat-ipc-refresh-all.1" "$pkgdir/usr/share/man/man1/istat-ipc-refresh-all.1"
  install -Dm644 "doc/istat-ipc-set-theme.1"   "$pkgdir/usr/share/man/man1/istat-ipc-set-theme.1"
  install -Dm644 "doc/istat-ipc-shutdown.1"    "$pkgdir/usr/share/man/man1/istat-ipc-shutdown.1"
  install -Dm644 "doc/istat-ipc-signal.1"      "$pkgdir/usr/share/man/man1/istat-ipc-signal.1"
  install -Dm644 "doc/istat-sensors.1"         "$pkgdir/usr/share/man/man1/istat-sensors.1"
  install -Dm644 "doc/istat-signals.1"         "$pkgdir/usr/share/man/man1/istat-signals.1"

  install -Dm644 "README.md"                   "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "sample_config.toml"          "$pkgdir/usr/share/doc/${pkgname}/sample_config.toml"
  install -Dm644 "sample_included_config.toml" "$pkgdir/usr/share/doc/${pkgname}/sample_included_config.toml"
  install -Dm644 "LICENSE"                     "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
