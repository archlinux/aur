# Maintainer: Ricardo (XenGi) Band <email@ricardo.band>

pkgname=c-lolcat
_pkgname=lolcat
pkgver=1.5
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
sha256sums=('2af79bed90e0bda52ae500d16e7e7022037fad10c487c317e7f0ff17ec4b14f5')

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
