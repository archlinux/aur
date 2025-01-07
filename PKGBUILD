# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: j605

pkgname=sccache-bin
pkgver=0.9.1
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
sha256sums_aarch64=('a0f10f7daeeecb3439d6e903bc5dc4a4ccee67985b506d3daf742521efe45627')
sha256sums_armv7h=('bae598316fc0e74f09c62990783df2357e98ea0d55c6acee60667103cf78a8ea')
sha256sums_i686=('d9fba1298e681b2f9b4ed0ee04c1100191b9ca2407ff47fff9074a7b1627315f')
sha256sums_x86_64=('911f611db54e48dc50c32232462a99848824be5ba0f6f52cc33903712cd78715')


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
