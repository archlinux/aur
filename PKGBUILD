# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=devdrop
pkgver=0.1.1
pkgrel=1
pkgdesc="Local-first workspace sync for developers"
arch=('x86_64' 'aarch64')
url="https://github.com/skorotkiewicz/devdrop"
license=('MIT')
depends=('gcc-libs' 'git' 'sqlite' 'openssl')
makedepends=()
options=(!strip)

source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/devdrop-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/devdrop-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=('c730580c1ec69d8bf819de87871a7c5f0015ddee285362b624f7f508f9c1ced7')
sha256sums_aarch64=('9293a774884a30436b7bc63606ec914cada141d145efbd4bb79be664c07660db')

package() {
  install -Dm755 devdrop "$pkgdir/usr/bin/devdrop"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
