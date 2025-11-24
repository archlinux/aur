pkgname=rice-switcher
pkgver=1.0.0
pkgrel=1
pkgdesc="Tool for switching and managing RICE for your desktop"
arch=('any')
url="https://github.com/S1rEx1/Rice-Switcher"
license=('GPL')
depends=('bash')
source=("$pkgname-$pkgver.tar.gz::https://github.com/S1rEx1/Rice-Switcher/archive/refs/heads/main.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$srcdir"

  install -Dm755 config_switcher.sh "$pkgdir/usr/bin/rice-switcher"

  install -dm755 "$pkgdir/usr/lib/rice-switcher/"
  install -Dm755 Lib/*.sh "$pkgdir/usr/lib/rice-switcher/"

  install -Dm755 nice_switcher_yay "$pkgdir/usr/bin/nice-switcher-yay"
  install -Dm644 config.json "$pkgdir/usr/share/rice-switcher/config.json"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
