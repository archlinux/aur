# $Id$
# Maintainer: Kresimir Pripuzic <kpripuzic@gmail.com>
pkgname=ginkgocadx-bin
pkgver=3.7.1.1573.46
pkgrel=5
pkgdesc="Complete DICOM viewer solution."
arch=('i686' 'x86_64')
url="http://ginkgo-cadx.com/"
license=('LGPL3')
depends=('libjpeg6-turbo' 'libpng12' 'openssl-1.0')
install="${pkgname}.install"
options=('!strip')
source=("http://ufpr.dl.sourceforge.net/project/ginkgocadx/${pkgver::5}/Ginkgo_CADx-${pkgver}_linux_x86_64.tgz"        
        "ginkgocadx.desktop"
        "ginkgocadx.png")
md5sums=('11726c3f9c6d93f7480bbaac8685403f'         
         '48d54bd45e5e36529dce9e6a6e8fbf46'
         '1de087126d5e72ecdacc2e215601827f')

package() {
  cd "${srcdir}"
  
  install -dm755 "${pkgdir}/opt/${pkgname}/"
  cp -a "${srcdir}/Ginkgo_CADx-${pkgver}_linux_x86_64/." "${pkgdir}/opt/${pkgname}/"

  install -D -m644 "${srcdir}/ginkgocadx.desktop" "${pkgdir}/usr/share/applications/ginkgocadx.desktop"
  install -D -m644 "${srcdir}/ginkgocadx.png" "${pkgdir}/usr/share/pixmaps/ginkgocadx.png"
}

# vim:set ts=2 sw=2 et:
