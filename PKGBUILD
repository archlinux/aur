# Maintainer: Adrin Jalali <adrin.jalali@gmail.com>
pkgname=aur-cooldown
pkgver=0.8.0
pkgrel=1
pkgdesc="Delay AUR upgrades until they have aged, so malicious pushes are caught before they land"
arch=('any')
url="https://github.com/adrinjalali/aur-cooldown"
license=('MIT')
depends=('python' 'git' 'pacman' 'base-devel')
optdepends=('yay: yay -Syu cooldown hook, wired by "aur-cooldown setup"'
            'zsh: staleness reminder snippet')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('eb9215a8f5578e09504282f875821a275b3eee1888cd252eb6fdbc45f41c790d')

package() {
  cd "$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
