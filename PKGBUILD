# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=envd
pkgver=0.1.5
pkgrel=1
pkgdesc="Tiny server that stores per-project environment variables"
arch=('x86_64' 'aarch64')
url="https://github.com/skorotkiewicz/envd"
license=('MIT')
depends=('gcc-libs')
options=(!strip)
install=envd.install

source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/envd-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/envd-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=('4fdc78fa55191788347b0c1d81e8cfca0028a5cc0dd764d4aeb3ef29bd4d14dc')
sha256sums_aarch64=('2b599f7dbd2c67d535a6146feddf2aa9fcb4f02a2d1380c453c9a222de090df3')

package() {
  install -Dm755 "envd" "$pkgdir/usr/bin/envd"
  install -Dm755 "enve" "$pkgdir/usr/bin/enve"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "server.yml.example" "$pkgdir/usr/share/doc/$pkgname/server.yml.example"
  install -Dm644 "client.yml.example" "$pkgdir/usr/share/doc/$pkgname/client.yml.example"

  install -Dm644 "systemd/envd.service" "$pkgdir/usr/lib/systemd/system/envd.service"
  install -Dm644 "systemd/envd-user.service" "$pkgdir/usr/lib/systemd/user/envd.service"
}
