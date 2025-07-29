# Maintainer: tdawe <tdawe2@gmail.com>
pkgname=steam-kde-vrr-toggle
pkgver=1.0.0
pkgrel=1
pkgdesc="A Steam wrapper to toggle VRR/Adaptive-Sync on a per-game basis in KDE Plasma (Wayland)."
arch=('any')
url="https://github.com/tdawe1/steam-kde-vrr-toggle"
license=('0BSD')
depends=('bash' 'jq' 'kscreen')
optdepends=('steam: For launching games')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "vrr_toggle.sh" "$pkgdir/usr/bin/vrr_toggle.sh"

  install -Dm755 "steam_vrr_wrapper.sh" "$pkgdir/usr/bin/steam_vrr_wrapper.sh"

  sed -i "s|/home/YOUR_USER/scripts/vrr_toggle.sh|/usr/bin/vrr_toggle.sh|g" "$pkgdir/usr/bin/steam_vrr_wrapper.sh"
}
