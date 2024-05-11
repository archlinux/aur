# Maintainer: Mintsuki <mintsuki@protonmail.com>
pkgname=jinx
pkgver=0.2.27.0
pkgrel=1
pkgdesc="A meta-build-system for building OS distributions"
arch=("any")
url="https://github.com/mintsuki/jinx"
license=("BSD")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mintsuki/jinx/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('c43cd40c990c4f42c3482ee32bc794f3373bec579dc6b18d8847230ed3833725ccdd469fb51b2a72546c44c683ecea594e91d41e64506c12a042d3bc0e332026')
depends=('gcc' 'sh' 'findutils' 'libarchive' 'git' 'curl' 'zstd' 'rsync')

package() {
  cd "$pkgname-$pkgver"
  make install DESTDIR="${pkgdir}" PREFIX=/usr
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
