# Maintainer: CS2 Server Blocker contributors
pkgname=cs2blocker
pkgver=0.1.2
pkgrel=1
pkgdesc="Linux-native Counter-Strike 2 server blocker with an interactive world map"
arch=('any')
url="https://github.com/NasirA1991/cs2-server-blocker"
license=('MIT')
depends=('python' 'nftables' 'polkit' 'systemd' 'python-gobject' 'python-cairo' 'gtk4' 'libadwaita>=1.4')
optdepends=('ipset: iptables/ipset fallback when nftables is unavailable')
makedepends=('git')
install=cs2blocker.install
source=("$pkgname::git+https://github.com/NasirA1991/cs2-server-blocker.git#tag=v${pkgver}")
sha256sums=('SKIP')

package() {
  cd "$srcdir/$pkgname"
  bash packaging/install.sh --root "$pkgdir" --no-daemon-reload
}
