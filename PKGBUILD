# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=ding-bin
pkgver=0.1.2
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
sha256sums_x86_64=('e5f41ecd8c81b555376fa674562d4ba1a12979628085ccf28bd7e66374d1f9fb')
sha256sums_aarch64=('b7a3e391c5db893568e1918a7dd907abd652678bffb9bb65292686d9c0420f71')

package() {
  install -Dm755 ding "$pkgdir/usr/bin/ding"
  install -Dm755 dong "$pkgdir/usr/bin/dong"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
