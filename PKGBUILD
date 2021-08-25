# Maintainer: Ricardo (XenGi) Band <email@ricardo.band>

pkgname=c-lolcat
_pkgname=lolcat
pkgver=1.2
pkgrel=2
pkgdesc="High-performance implementation of lolcat"
arch=('i686' 'x86_64')
url="https://github.com/jaseg/lolcat"
license=('WTFPL')
depends=()
makedepends=()
conflicts=('lolcat')
provides=('lolcat')
source=("https://github.com/jaseg/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('b6e1a0e24479fbdd4eb907531339e2cafc0c00b78d19caf70e8377b8b7546331')

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
