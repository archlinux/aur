# Maintainer: Arthur Zamarin <arthurzam@gmail.com> 

_pkgname=pcmanfm-image-size-module
pkgname=${_pkgname}-git
pkgver=r7.8e7344d
pkgrel=1
pkgdesc="Module for pcmanfm to print image size to status bar when file selected"
arch=(i686 x86_64)
url="https://github.com/fenixk19/${_pkgname}"
license=('GPL2')
depends=('pcmanfm' 'imagemagick')
source=("${_pkgname}::git+git://github.com/fenixk19/${_pkgname}.git")
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
 
build() {
  cd "${srcdir}/${_pkgname}"
  make
}
 
package() {
  install -Dm 755 "${srcdir}/${_pkgname}/.libs/pcmanfm-image-size-plugin.so" "${pkgdir}/usr/lib/libfm/modules/image-size-plugin.so"
}

