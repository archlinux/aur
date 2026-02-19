# Maintainer: Richard Cesar

pkgname=nxmc-bin
pkgver=6.0.2
pkgrel=1
pkgdesc="Graphical console for NetXMS NMS based on Eclipse."
arch=('x86_64')
url="https://www.netxms.org/"
license=('custom')
depends=(java-environment)
source_x86_64=(
               nxmc.desktop
               nxmc
               icon.png
               https://netxms.com/download/releases/6.0/nxmc-${pkgver}-standalone.jar
               )
sha256sums_x86_64=(
                   'a8fd91020c07d78163bcc4988ab94ca192240bb01566138cc6ed531e3d183e9c'
                   'dbf059c5f1aaadba5a978c2f44c9f9b5af6885a54cf12b8741ee0caf7134b022'
                   '71c258c332ab3da2dd473f042f92eded7e3d6e97f3bdeff19bbd4a09b9f9691b'
                   '8fdad8913f6597c91e06ae1b215002bdbce59359cd8b864d7cd07b2e3c0a910f'
                   )
package() {
  install -d "${pkgdir}/opt/nxmc"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/pixmaps"

  install -m644 "${srcdir}/nxmc.desktop" "${pkgdir}/usr/share/applications/nxmc.desktop"
  install -m644 "${srcdir}/nxmc-${pkgver}-standalone.jar" "${pkgdir}/opt/nxmc/nxmc-${pkgver}-standalone.jar"
  install -m777 "${srcdir}/nxmc" "${pkgdir}/opt/nxmc/nxmc"

  sed -i "s/VERSION/${pkgver}/g" ${pkgdir}/opt/nxmc/nxmc

  install -m644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/nxmc.png"
  
}

