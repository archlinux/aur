# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=buildcache-bin
pkgver=0.32.0
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
sha256sums_aarch64=('b068d674c2557212c8faeaf7d10d469bae471f5af1fddd585740dc82a82b9be9')
sha256sums_x86_64=('b2519eb357dd246fad03d01fa0e1db786a9625f77f1f42ff961cfab32cd6bbb6')


package() {
  cd "buildcache"

  install -dm755 "$pkgdir/usr"
  cp -rf ./* "$pkgdir/usr"
  install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/buildcache"
}
