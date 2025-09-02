# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=buildcache-bin
pkgver=0.31.5
pkgrel=1
pkgdesc="An advanced compiler accelerator"
arch=('aarch64' 'x86_64')
url="https://gitlab.com/bits-n-bites/buildcache"
license=('Zlib')
depends=('gcc-libs' 'openssl')
optdepends=('lua')
provides=("buildcache=$pkgver")
conflicts=('buildcache')
source=("LICENSE::https://gitlab.com/bits-n-bites/buildcache/-/raw/master/LICENSE")
source_aarch64=("https://gitlab.com/bits-n-bites/buildcache/-/releases/v$pkgver/downloads/buildcache-linux-arm64.tar.gz")
source_x86_64=("https://gitlab.com/bits-n-bites/buildcache/-/releases/v$pkgver/downloads/buildcache-linux-amd64.tar.gz")
sha256sums=('SKIP')
sha256sums_aarch64=('624538a4fed55e9155e64d8f9dd8a17b443ee4925ebff601d252a2d3849a0cc0')
sha256sums_x86_64=('b5c02e46d79a1abd201103fbef58c0b9858cd597b643d7167fd9873eb15ef168')


package() {
  cd "buildcache"

  install -dm755 "$pkgdir/usr"
  cp -rf * "$pkgdir/usr"
  install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/buildcache"
}
