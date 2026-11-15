# Maintainer: Adrin Jalali <adrin.jalali@gmail.com>
pkgname=aur-cooldown
pkgver=0.8.1
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
sha256sums=('be395dd3730ddd6804b2365bd803d54fb19fb37c9a23e3c4398ded20f2daf124')

package() {
  cd "$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
