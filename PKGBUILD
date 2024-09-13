# Maintainer: Mintsuki <mintsuki@protonmail.com>
pkgname=jinx
pkgver=0.3.4
pkgrel=1
pkgdesc="A meta-build-system for building OS distributions"
arch=("any")
url="https://github.com/mintsuki/jinx"
license=("BSD")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mintsuki/jinx/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('461195ce4388889daa7a10680ac2f2e710ebebadf9d385199360de1b0aa044d9dfffa8d3f03f8662bdfbd76c8d75776479f0af1056cd5ecdd880292d97177812')
depends=('sh' 'curl' 'findutils' 'awk' 'gcc' 'git' 'grep' 'gzip' 'libarchive' 'procps' 'rsync' 'tar' 'zstd')

package() {
  cd "$pkgname-$pkgver"
  make install DESTDIR="${pkgdir}" PREFIX=/usr
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
