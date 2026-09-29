pkgname=relaybar-bin
pkgver=0.1.4
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
sha256sums=('d7c6dba82460b4db7fb635de7a5c3cc128cb2c7fa42e7df0f1451633ee8d3f9c')

package() {
  cd "$_source"
  install -Dm755 relaybar "$pkgdir/usr/bin/relaybar"
  install -Dm644 assets/relaybar.desktop "$pkgdir/usr/share/applications/relaybar.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
