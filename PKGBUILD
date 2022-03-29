# Maintainer: Jake McGinty <me@jake.su>

pkgname=mullvad-netns
pkgver=0.4
pkgrel=1
pkgdesc="Script to run a command within a Mullvad network namespace"
arch=('any')
url="https://github.com/chutz/mullvad-netns"
license=('GPL2')
depends=('iproute2' 'curl' 'wireguard-tools' 'util-linux' 'bash' 'jq')
makedepends=('git' 'make' 'coreutils')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('d9fdf0bbb636d143dac34181da9636e23c1e5284496a36b1fe02fc90c67bda5d')

package() {
  cd "$pkgname-$pkgver"

  make BINDIR="usr/bin" DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

