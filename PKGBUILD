# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: j605

pkgname=sccache-bin
pkgver=0.7.7
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
sha256sums_aarch64=('e7ecabac9a703e53a8b06e84b0058fcf242239d164050537bc399387160320fb')
sha256sums_armv7h=('32b080b1c893874672acacff4a0e2fc88de29b42ddfd58146765cb6a1b9044ce')
sha256sums_i686=('cee44aadc73ad1675ded76dcc2f12c11fc880538db905d4f342c66bde925a66f')
sha256sums_x86_64=('ed0010b4dcaccce42b9dc8699257134a113d0ca16dfb7db890356135218322c9')


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
