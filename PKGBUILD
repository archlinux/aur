# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=albiononline
pkgver=20160730075025
pkgrel=2
pkgdesc="The first true cross-platform Sandbox MMO"
url="https://albiononline.com/"
arch=('x86_64')
license=('custom')
depends=('libgl' 'gstreamer0.10-good')
source=(${pkgname}-${pkgver}.zip::"https://live.albiononline.com/clients/${pkgver}/albion-online-setup" "albiononline.desktop")

options=(!strip docs libtool emptydirs !zipman staticlibs !upx)
md5sums=('6926c3587406b4c40d00552b7a6c892f'
         'cec7e1ad7f4f8acfc0628d0dd8d421e6')

install=${pkgname}.install

package() {
  mkdir -p "${pkgdir}/opt"
  cp -a "${srcdir}/data" "${pkgdir}/opt/${pkgname}"
  
  # link exe
  mkdir -p ${pkgdir}/usr/bin
  ln -s "/opt/$pkgname/Albion-Online" "${pkgdir}/usr/bin/${pkgname}"

  # install .desktop file
  install -m755 -D ${srcdir}/albiononline.desktop -t ${pkgdir}/usr/share/applications
}

# vim:set ts=2 sw=2 et:

