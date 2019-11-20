# Maintainer: zoe <chp321 AT gmail DOT com>

pkgname=biniax2
pkgver=2.1.30
_pkgname=biniax
_pkgver=1.30
pkgrel=4
pkgdesc="Arcade game : match two similar fruits, and they will disappear, just clear your way and avoid being blocked"
arch=('i686' 'x86_64')
url="http://${_pkgname}.com/"
license=('Zlib license')
depends=('sdl' 'sdl_image' 'sdl_mixer')
makedepends=('make')
install=${pkgname}.install
source=("http://mordred.dir.bg/${_pkgname}/${pkgname}-${_pkgver}-fullsrc.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.png"
        "${pkgname}.sh")
md5sums=('53e90cf42b825af23e086f4562234ae3'
         '6acae7917e24b38284d454449e0391b4'
         '7424a0af67b621729ba03a2729ca41f3'
         'ff9a5dcff489333298534d5750bf5c4c')

build() {
  cd "${srcdir}"
  make
}

package() {
  mkdir -p ${pkgdir}/opt/${pkgname}/
  mv ${srcdir}/data ${pkgdir}/opt/${pkgname}/data
  install -DTm755 ${srcdir}/${pkgname}           "${pkgdir}/opt/${pkgname}/${pkgname}"
  install -DTm644 ${srcdir}/LICENSE.txt          "${pkgdir}/share/licenses/${pkgname}/LICENSE"
  install -DTm644 ${startdir}/${pkgname}.png     "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${pkgname}.png"
  install -DTm644 ${startdir}/${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -DTm755 ${startdir}/${pkgname}.sh      "${pkgdir}/usr/bin/${pkgname}"
  }
