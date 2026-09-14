# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: j605

pkgname=sccache-bin
pkgver=0.18.0
pkgrel=1
pkgdesc="Shared compilation cache"
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
url="https://github.com/mozilla/sccache"
license=('Apache-2.0')
provides=("sccache=$pkgver")
conflicts=('sccache')
source_aarch64=("https://github.com/mozilla/sccache/releases/download/v$pkgver/sccache-v$pkgver-aarch64-unknown-linux-musl.tar.gz")
source_armv7h=("https://github.com/mozilla/sccache/releases/download/v$pkgver/sccache-v$pkgver-armv7-unknown-linux-musleabi.tar.gz")
source_i686=("https://github.com/mozilla/sccache/releases/download/v$pkgver/sccache-v$pkgver-i686-unknown-linux-musl.tar.gz")
source_x86_64=("https://github.com/mozilla/sccache/releases/download/v$pkgver/sccache-v$pkgver-x86_64-unknown-linux-musl.tar.gz")
sha256sums_aarch64=('2b3284d5da3b46a47dc4229e75bb7b88ac4aa99c8d754fb7d2f84997e5a4354a')
sha256sums_armv7h=('5e1b69e95cee1b19f0d0669eb1b1597f51770fc602e4321adfea99143cac6ce9')
sha256sums_i686=('e23e961b549c3c40ac0d504e0d4a63a5da2ef1b44ac253c55bef55e755fdf340')
sha256sums_x86_64=('45f1447fbe231e3037bde351ef70677dd212216c8d62ae7ca409fecc4d6acc89')


package() {
  if [ "$CARCH" = "aarch64" ]; then
    cd "sccache-v$pkgver-aarch64-unknown-linux-musl"
  elif [ "$CARCH" = "armv7h" ]; then
    cd "sccache-v$pkgver-armv7-unknown-linux-musl"
  elif [ "$CARCH" = "i686" ]; then
    cd "sccache-v$pkgver-i686-unknown-linux-musl"
  elif [ "$CARCH" = "x86_64" ]; then
    cd "sccache-v$pkgver-x86_64-unknown-linux-musl"
  fi

  install -Dm755 "sccache" -t "$pkgdir/usr/bin"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/sccache"
}
