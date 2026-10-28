# Maintainer: Nauris Steins <me@naurissteins.com>
pkgname=kwybars-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Desktop audio visualizer for Wayland that renders real-time audio bars on screen"
arch=('x86_64')
url="https://github.com/naurissteins/Kwybars"
license=('GPL-3.0-or-later')
provides=('kwybars')
conflicts=('kwybars' 'kwybars-git')
options=('!debug')
depends=('gcc-libs' 'glibc' 'pipewire')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/naurissteins/Kwybars/releases/download/$pkgver/kwybars-$pkgver-x86_64-linux.tar.gz"
)
# run updpkgsums once the release tarball exists
sha256sums=('575c672394756c7b0aac3635438ff39fde9b7c8dbf56bf0cfc0bbf8e5f590cc0')

package() {
  cd "kwybars-$pkgver-x86_64-linux"

  install -Dm755 kwybars "$pkgdir/usr/bin/kwybars"
  install -Dm644 kwybars.service "$pkgdir/usr/lib/systemd/user/kwybars.service"
  install -Dm644 themes/*.toml -t "$pkgdir/usr/share/kwybars/themes"
  install -Dm644 examples/*.toml -t "$pkgdir/usr/share/doc/kwybars/examples"
  install -Dm644 share/man/man1/kwybars.1 "$pkgdir/usr/share/man/man1/kwybars.1"
  install -Dm644 README.md "$pkgdir/usr/share/doc/kwybars/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
