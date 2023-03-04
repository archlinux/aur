# Maintainer: Ricardo (XenGi) Band <email@ricardo.band>

pkgname=c-lolcat
_pkgname=lolcat
pkgver=1.4
pkgrel=1
pkgdesc="High-performance implementation of lolcat"
arch=('i686' 'x86_64')
url="https://github.com/jaseg/lolcat"
license=('WTFPL')
depends=()
makedepends=()
conflicts=('lolcat')
provides=('lolcat')
source=("https://github.com/jaseg/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('6ea43ee2b2bb2f15fc91812b72ebcdaa883052853ed8f055b6f8b38637bda909')

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
