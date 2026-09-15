# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=uutils-shadow-bin
pkgver=0.5.1
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
sha256sums_aarch64=('20714824b4f65d2632a8cd38a2ba3e59c452209554d6825411c56abe85cb5a8a')
sha256sums_x86_64=('e8aed23e97667e01059fd32fb409dc249b6969da55cfc16995895d3b699e2e23')


package() {
  install -Dm6755 "$srcdir/uu_shadow-$CARCH-unknown-linux-gnu/shadow-rs" -t "$pkgdir/usr/bin"
  install -Dm644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/uutils-shadow/LICENSE"
}
