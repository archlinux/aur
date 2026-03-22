# Maintainer: Windblows2000 <Xs1244@protonmail.com>
pkgname=nexa-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="High-performance, Rust-based MPRIS controller and daemon"
arch=('x86_64')
url="https://github.com/Windblows2000/Nexa"
license=('GPL3-or-later')
provides=('nexa')
conflicts=('nexa')
install=nexa.install
source=("https://github.com/Windblows2000/Nexa/releases/download/v$pkgver/nexa-v$pkgver-x86_64-linux.tar.gz")
sha256sums=('48a1a49442fbfd3ff40d8990a894f74bfbbb81788b7d4df0876e5a10a39bd49d')

package() {
  cd "$srcdir/nexa-v$pkgver-x86_64-linux"
  install -Dm755 nexa "$pkgdir/usr/bin/nexa"
  install -Dm755 nexad "$pkgdir/usr/bin/nexad"
  install -Dm644 nexad.service "$pkgdir/usr/lib/systemd/user/nexad.service"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
