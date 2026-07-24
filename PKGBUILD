pkgname=relaybar-bin
pkgver=0.1.2
pkgrel=1
pkgdesc='GTK manager for SSH local port forwards'
arch=('x86_64')
url='https://github.com/skorotkiewicz/RelayBar'
license=('MIT')
depends=('gtk4' 'openssh')
provides=('relaybar')
conflicts=('relaybar')
options=('!debug')
_source="relaybar-v$pkgver-$CARCH-unknown-linux-gnu"
source=("$_source.tar.gz::$url/releases/download/v$pkgver/$_source.tar.gz")
sha256sums=('e61f5a50aaf87d80f40a30c7ecf09abf9305f59f1a27ec679bc8a4ff18bda5a7')

package() {
  cd "$_source"
  install -Dm755 relaybar "$pkgdir/usr/bin/relaybar"
  install -Dm644 assets/relaybar.desktop "$pkgdir/usr/share/applications/relaybar.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
