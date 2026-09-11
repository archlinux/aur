# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=uutils-shadow-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="A memory-safe reimplementation of the Linux shadow-utils in Rust"
arch=('aarch64' 'x86_64')
url="https://github.com/uutils/shadow"
license=('MIT')
depends=('glibc' 'libgcc' 'libxcrypt-compat' 'pam')
provides=("uutils-shadow=$pkgver")
conflicts=('uutils-shadow')
source=("$pkgname-$pkgver-LICENSE::https://raw.githubusercontent.com/uutils/shadow/refs/heads/main/LICENSE")
source_aarch64=("$pkgname-$pkgver-aarch64::https://github.com/uutils/shadow/releases/download/0.5.0/uu_shadow-aarch64-unknown-linux-gnu.tar.gz")
source_x86_64=("$pkgname-$pkgver-x86_64::https://github.com/uutils/shadow/releases/download/0.5.0/uu_shadow-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('SKIP')
sha256sums_aarch64=('97bdc077fa0f5964867c1e87d7e8d153c8d054c0b1e70ee107447ff08d7025f6')
sha256sums_x86_64=('1d9c5069e9849b084815b5d46ee112ca78240533f553a3aca438fd5ee4ab083d')


package() {
  install -Dm755 "$srcdir/uu_shadow-$CARCH-unknown-linux-gnu/shadow-rs" -t "$pkgdir/usr/bin"
  install -Dm644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/uutils-shadow/LICENSE"
}
