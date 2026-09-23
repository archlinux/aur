# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=buildcache-bin
pkgver=0.33.1
pkgrel=1
pkgdesc="An advanced compiler accelerator"
arch=('aarch64' 'x86_64')
url="https://gitlab.com/bits-n-bites/buildcache"
license=('Zlib')
depends=('libgcc' 'libstdc++' 'glibc' 'openssl')
optdepends=('lua')
provides=("buildcache=$pkgver")
conflicts=('buildcache')
source=("LICENSE::https://gitlab.com/bits-n-bites/buildcache/-/raw/master/LICENSE")
source_aarch64=("https://gitlab.com/bits-n-bites/buildcache/-/releases/v$pkgver/downloads/buildcache-linux-arm64.tar.gz")
source_x86_64=("https://gitlab.com/bits-n-bites/buildcache/-/releases/v$pkgver/downloads/buildcache-linux-amd64.tar.gz")
sha256sums=('SKIP')
sha256sums_aarch64=('c60d5826edfeb8701760e6a84c328d8e6abb5c9c1b7abf8cc5c5b519f95fa18f')
sha256sums_x86_64=('d9ac1eea25b8b10755b48ef6ac39d25fdecb1d61b4d3ca943fcac6020cc37bb4')


package() {
  cd "buildcache"

  install -dm755 "$pkgdir/usr"
  cp -rf ./* "$pkgdir/usr"
  install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/buildcache"
}
