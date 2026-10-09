# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=ding-bin
pkgver=0.1.0
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
sha256sums_x86_64=('ce1235e16860c1ebbba1a952afddb6efbcfc0e0e24ac26a0b74b3f8132731c45')
sha256sums_aarch64=('11e7220f4bac8c2473db9fed59955a54bc4bb747b3b4710c042673403797b166')

package() {
  install -Dm755 ding "$pkgdir/usr/bin/ding"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
