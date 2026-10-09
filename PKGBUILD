# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=ding-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Looping audio notifications for your terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/skorotkiewicz/ding"
license=('unknown')
depends=('gcc-libs' 'alsa-lib')
conflicts=('ding')
makedepends=()
options=(!strip)

source_x86_64=("$pkgname-$pkgver-$pkgrel-x86_64.tar.gz::$url/releases/download/v$pkgver/ding-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-$pkgrel-aarch64.tar.gz::$url/releases/download/v$pkgver/ding-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")

# The release workflow fills in checksums with updpkgsums before AUR publication.
sha256sums_x86_64=('00e5cb052607eed80934187bb9b8d93a452c600a693bb4cfc8a35a63298aa1c6')
sha256sums_aarch64=('f8df38e81618ec45a765189ac3bda015033cd3c5d48b3e9a1c1f7d22b9a52ce0')

package() {
  install -Dm755 ding "$pkgdir/usr/bin/ding"
  install -Dm755 dong "$pkgdir/usr/bin/dong"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
