# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=envd
pkgver=0.1.0
pkgrel=1
pkgdesc="Tiny server that stores per-project environment variables"
arch=('x86_64' 'aarch64')
url="https://github.com/skorotkiewicz/envd"
license=('MIT')
depends=('gcc-libs')
makedepends=()

source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/envd-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/envd-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=('7ec194c9a137caed5f7bb73f2db7d949e54b76fd57347871c32c1b5b0311ae94')
sha256sums_aarch64=('6670857eeda53f913827763dff97f37ec38a61fda9e27c33ead788ac382605a6')

package() {
  install -Dm755 "envd" "$pkgdir/usr/bin/envd"
  install -Dm755 "enve" "$pkgdir/usr/bin/enve"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "server.yml.example" "$pkgdir/usr/share/doc/$pkgname/server.yml.example"
  install -Dm644 "client.yml.example" "$pkgdir/usr/share/doc/$pkgname/client.yml.example"
}
