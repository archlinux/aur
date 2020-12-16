# Maintainer: fatalis <fatalis@fatalis.pw>
pkgname=lzbench
pkgver=1.8.1
pkgrel=1
pkgdesc='An in-memory benchmark of open-source LZ77/LZSS/LZMA compressors'
arch=('x86_64' 'aarch64')
url='https://github.com/inikep/lzbench'
license=('unknown')
depends=('gcc-libs')
conflicts=('lzbench-git')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('57c9d18d0da90d980cd26d746ca5407a2fdfdbc0622df8f276a8462a705c9096')

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 lzbench "${pkgdir}/usr/bin/lzbench" 
}
