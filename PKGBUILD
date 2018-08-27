# Maintainer: Ricardo (XenGi) Band <email@ricardo.band>

pkgname=c-lolcat
pkgver=r40.ceb4d66
pkgrel=2
pkgdesc="High-performance implementation of lolcat"
arch=('i686' 'x86_64')
url="https://github.com/jaseg/lolcat"
license=('WTFPL')
depends=()
makedepends=()
conflicts=('lolcat' 'pyhton-lolcat')
source=("${pkgname}"::'git+https://github.com/jaseg/lolcat.git')
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git describe --always)"
}

#prepare() {
#    cd "${srcdir}/${pkgname}"
    #git submodule update --init musl
    #git submodule update --init memorymapping
    #git submodule init
    #git submodule update
#}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  #mkdir -p "${pkgdir}/usr/bin"
  #make DESTDIR="${pkgdir}/usr/bin" install
  install --mode=755 -D -- lolcat ${pkgdir}/usr/bin/lolcat
}
