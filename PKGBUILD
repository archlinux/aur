# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: j605

pkgname=sccache-bin
pkgver=0.10.0
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
sha256sums_aarch64=('d6a1ce4acd02b937cd61bc675a8be029a60f7bc167594c33d75732bbc0a07400')
sha256sums_armv7h=('ab7af4e5c78aa71f38145e7bed41dd944d99ce5a00339424d927f8bbd8b61b78')
sha256sums_i686=('f597998f8e1b46eef51c689cef4b178ecd5e06d285209a5d290d80a7be7dad88')
sha256sums_x86_64=('1fbb35e135660d04a2d5e42b59c7874d39b3deb17de56330b25b713ec59f849b')


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
