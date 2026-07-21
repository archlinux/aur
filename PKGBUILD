# Maintainer: Adrin Jalali <adrin.jalali@gmail.com>
pkgname=aur-cooldown
pkgver=0.7.1
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
sha256sums=('2fc6db004fde94c23940f8854682d447fb3f20db2a5b1947f75114f2064607e2')

package() {
  cd "$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
