# Maintainer: fatalis <fatalis@fatalis.pw>
pkgname=lzbench
pkgver=1.8
pkgrel=1
pkgdesc='An in-memory benchmark of open-source LZ77/LZSS/LZMA compressors'
arch=('x86_64' 'aarch64')
url='https://github.com/inikep/lzbench'
license=('unknown')
depends=('gcc-libs')
conflicts=('lzbench-git')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('e1ee32a14ca8858e32571a996a197f9978e49812934a8f4d4d46c3e189b0325d')

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 lzbench "${pkgdir}/usr/bin/lzbench" 
}
