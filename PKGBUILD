# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=buildcache-bin
pkgver=0.31.7
pkgrel=1
pkgdesc="An advanced compiler accelerator"
arch=('aarch64' 'x86_64')
url="https://gitlab.com/bits-n-bites/buildcache"
license=('Zlib')
depends=('gcc-libs' 'glibc' 'openssl')
optdepends=('lua')
provides=("buildcache=$pkgver")
conflicts=('buildcache')
source=("LICENSE::https://gitlab.com/bits-n-bites/buildcache/-/raw/master/LICENSE")
source_aarch64=("https://gitlab.com/bits-n-bites/buildcache/-/releases/v$pkgver/downloads/buildcache-linux-arm64.tar.gz")
source_x86_64=("https://gitlab.com/bits-n-bites/buildcache/-/releases/v$pkgver/downloads/buildcache-linux-amd64.tar.gz")
sha256sums=('SKIP')
sha256sums_aarch64=('ba93883abce222608f598e9aeaa2707f2696eabf16624dfba38ebeb8c1bae384')
sha256sums_x86_64=('fd9f4499570f1b6bf74ade251c4f8fdf895358f4899f6d5fbdf4b13f0eca7260')


package() {
  cd "buildcache"

  install -dm755 "$pkgdir/usr"
  cp -rf ./* "$pkgdir/usr"
  install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/buildcache"
}
