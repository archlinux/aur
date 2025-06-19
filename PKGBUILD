# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=buildcache-bin
pkgver=0.31.4
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
sha256sums_aarch64=('7c8173cb62071df8b909c29ba448b8b22c687667b73616fc1098f7384cf75d89')
sha256sums_x86_64=('d8ae6cc660263ea47e151f6addaf2686d39cefb4b8b37ccef36dca742335e19d')


package() {
  cd "buildcache"

  install -dm755 "$pkgdir/usr"
  cp -rf * "$pkgdir/usr"
  install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/buildcache"
}
