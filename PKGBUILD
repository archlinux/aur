# Maintainer: Callum Osmotherly <acheronfail@gmail.com>
pkgname=i3stat-bin
pkgver=0.10.4_rc1
pkgrel=1
pkgdesc="A lightweight and batteries-included status_command for i3 and sway"
arch=('x86_64')
url="https://github.com/acheronfail/i3stat"
license=('GPL-3.0-only')
conflicts=('i3stat' 'i3stat-git')
depends=('gcc-libs')
optdepends=(
  'dbus: sending notifications'
  'dunst: showing if notifications are paused or not via dunst'
  'i3-wm: use it as the i3 status_command'
)
source=("${pkgname%-bin}-${pkgver}.zip::$url/releases/download/${pkgver//_/-}/${pkgname%-bin}-x86_64-unknown-linux-gnu.zip")
sha512sums=('9f3ccbe9f4927e4749970f5ade2c60ecfd56be2dcb4bf37a25b20a2f432a911ef7d96a0d9e71eb360a58fbb12ae7a821b92f2c733d12ac9ba1ef9e853fe13868')

package() {
  cd "${pkgname%-bin}-x86_64-unknown-linux-gnu"

  install -Dm755 "i3stat"         "$pkgdir/usr/bin/i3stat"
  install -Dm755 "i3stat-ipc"     "$pkgdir/usr/bin/i3stat-ipc"
  install -Dm755 "i3stat-acpi"    "$pkgdir/usr/bin/i3stat-acpi"
  install -Dm755 "i3stat-signals" "$pkgdir/usr/bin/i3stat-signals"
  install -Dm755 "i3stat-sensors" "$pkgdir/usr/bin/i3stat-sensors"

  install -Dm644 "doc/i3stat.1"                 "$pkgdir/usr/share/man/man1/i3stat.1"
  install -Dm644 "doc/i3stat-acpi.1"            "$pkgdir/usr/share/man/man1/i3stat-acpi.1"
  install -Dm644 "doc/i3stat-ipc.1"             "$pkgdir/usr/share/man/man1/i3stat-ipc.1"
  install -Dm644 "doc/i3stat-ipc-click.1"       "$pkgdir/usr/share/man/man1/i3stat-ipc-click.1"
  install -Dm644 "doc/i3stat-ipc-custom.1"      "$pkgdir/usr/share/man/man1/i3stat-ipc-custom.1"
  install -Dm644 "doc/i3stat-ipc-get-bar.1"     "$pkgdir/usr/share/man/man1/i3stat-ipc-get-bar.1"
  install -Dm644 "doc/i3stat-ipc-get-config.1"  "$pkgdir/usr/share/man/man1/i3stat-ipc-get-config.1"
  install -Dm644 "doc/i3stat-ipc-get-theme.1"   "$pkgdir/usr/share/man/man1/i3stat-ipc-get-theme.1"
  install -Dm644 "doc/i3stat-ipc-info.1"        "$pkgdir/usr/share/man/man1/i3stat-ipc-info.1"
  install -Dm644 "doc/i3stat-ipc-refresh-all.1" "$pkgdir/usr/share/man/man1/i3stat-ipc-refresh-all.1"
  install -Dm644 "doc/i3stat-ipc-set-theme.1"   "$pkgdir/usr/share/man/man1/i3stat-ipc-set-theme.1"
  install -Dm644 "doc/i3stat-ipc-shutdown.1"    "$pkgdir/usr/share/man/man1/i3stat-ipc-shutdown.1"
  install -Dm644 "doc/i3stat-ipc-signal.1"      "$pkgdir/usr/share/man/man1/i3stat-ipc-signal.1"
  install -Dm644 "doc/i3stat-sensors.1"         "$pkgdir/usr/share/man/man1/i3stat-sensors.1"
  install -Dm644 "doc/i3stat-signals.1"         "$pkgdir/usr/share/man/man1/i3stat-signals.1"

  install -Dm644 "README.md"                   "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "sample_config.toml"          "$pkgdir/usr/share/doc/${pkgname}/sample_config.toml"
  install -Dm644 "sample_included_config.toml" "$pkgdir/usr/share/doc/${pkgname}/sample_included_config.toml"
  install -Dm644 "LICENSE"                     "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
