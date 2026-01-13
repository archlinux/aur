# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: j605

pkgname=sccache-bin
pkgver=0.13.0
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
sha256sums_aarch64=('1bbbd570aa957db85c1e7c3fbc790f7766d4406347371b884515ed723ac03086')
sha256sums_armv7h=('3101f6f22e97b57a8c0e4136790a6321264950c165c78ba7c1332f68b53c2f37')
sha256sums_i686=('f8534cb48635e5c69240ea574980210dbb7a1efe1a282ce4d9f5224d9d8dbfc0')
sha256sums_x86_64=('0f57d80d0036967bc06b8391dcf4b527a6837187de454b55222ce4e0d5e19d0a')


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
