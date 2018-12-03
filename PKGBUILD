# Maintainer: Ricardo (XenGi) Band <email@ricardo.band>

pkgname=c-lolcat
_pkgname=lolcat
pkgver=1.0
pkgrel=1
pkgdesc="High-performance implementation of lolcat"
arch=('i686' 'x86_64')
url="https://github.com/jaseg/lolcat"
license=('WTFPL')
depends=()
makedepends=()
conflicts=('lolcat' 'pyhton-lolcat')
source=("https://github.com/jaseg/lolcat/archive/v${pkgver}.tar.gz")
sha256sums=('77ebfecde6afdf24447dd834507ea8bc550ee89b0e1211e7d3866a4824a6ee1d')

#prepare() {
#    cd "${srcdir}/${pkgname}-${pkgver}"
    #git submodule update --init musl
    #git submodule update --init memorymapping
    #git submodule init
    #git submodule update
#}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/bin"
  make DESTDIR="${pkgdir}/usr/bin" install
  #install --mode=755 -D -- lolcat ${pkgdir}/usr/bin/lolcat
}
