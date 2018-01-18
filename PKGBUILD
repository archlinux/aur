# Maintainer: givemeurhats <givemeurhats [at] gmail [dot] com>

pkgname=protonmail-desktop
pkgver=0.5.4
pkgrel=1
pkgdesc="Unofficial app that emulates a native client for the ProtonMail e-mail service"
url="https://github.com/protonmail-desktop/application"
license=('GPL3')
arch=('any')
provides=('protonmail-desktop')
source=(https://github.com/protonmail-desktop/application/releases/download/v0.5.4/protonmail-desktop-0.5.4.tar.gz
        https://i.imgur.com/hySaVZp.png
        protonmail-desktop.desktop
        protonmail-desktop)
md5sums=('515731f7f255ae3605f5ca013b14420e'
         '3cd502ea0bdb20f99cc8a018084746d4'
         '738f1086d70031a262aacf329de0d06c'
         '6edb6dd0aad1511978dca145114e87b7')

package() {
  mkdir -p ${pkgdir}/opt/protonmail-desktop/icons
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/share/applications
  cp -R ${srcdir}/protonmail-desktop-${pkgver}/* ${pkgdir}/opt/protonmail-desktop/
  cp ${srcdir}/protonmail-desktop ${pkgdir}/usr/bin/
  cp ${srcdir}/hySaVZp.png ${pkgdir}/opt/protonmail-desktop/icons/protonmail-desktop.png
  chmod +x ${pkgdir}/usr/bin/protonmail-desktop
  cp ${srcdir}/protonmail-desktop.desktop ${pkgdir}/usr/share/applications/
}
