# Maintainer: fatalis <fatalis@fatalis.pw>
pkgname=lzbench
pkgver=1.7.1
pkgrel=1
pkgdesc='An in-memory benchmark of open-source LZ77/LZSS/LZMA compressors'
arch=('x86_64')
url='https://github.com/inikep/lzbench'
license=('unknown')
depends=('gcc-libs')
conflicts=('lzbench-git')
source=("${url}/archive/v${pkgver}.tar.gz"
        'no-static.patch')
sha256sums=('751a7544a54fae050f5d7fd64c470da9cbc31cd126b43366ff495a2923cd7471'
            '0e3f1de18f9da318163a7c771a4c15fee38b16c2f26390ee61b51eef0d9eb19e')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -p0 < ../no-static.patch
}

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 lzbench "${pkgdir}/usr/bin/lzbench" 
}
