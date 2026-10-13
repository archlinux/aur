# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=uutils-shadow-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="A memory-safe reimplementation of the Linux shadow-utils in Rust"
arch=('aarch64' 'x86_64')
url="https://github.com/uutils/shadow"
license=('MIT')
depends=('glibc' 'libgcc' 'libxcrypt-compat' 'pam')
provides=("uutils-shadow=$pkgver")
conflicts=('uutils-shadow')
source=("$pkgname-$pkgver-LICENSE::https://raw.githubusercontent.com/uutils/shadow/refs/heads/main/LICENSE")
source_aarch64=("$pkgname-$pkgver-aarch64::https://github.com/uutils/shadow/releases/download/$pkgver/uu_shadow-aarch64-unknown-linux-gnu.tar.gz")
source_x86_64=("$pkgname-$pkgver-x86_64::https://github.com/uutils/shadow/releases/download/$pkgver/uu_shadow-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('SKIP')
sha256sums_aarch64=('8d67a9a8c64f1d0c8834541c58f1ad6fa416c443c9b29589f43837e8d9f925b4')
sha256sums_x86_64=('e83b3f36684b4973b173a57f9ba2eade418e25a823351924e15a1eddf20fc7b3')


package() {
  install -Dm6755 "$srcdir/uu_shadow-$CARCH-unknown-linux-gnu/shadow-rs" -t "$pkgdir/usr/bin"
  install -Dm644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/uutils-shadow/LICENSE"
}
