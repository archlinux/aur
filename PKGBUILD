# Maintainer: adlerweb <aur at adlerweb dot info>
# AUR3-package: kfgz <kfgz at interia dot pl>

pkgname=ols
pkgver=0.9.7.2
pkgrel=2
pkgdesc="A software client for the Open Bench Logic Sniffer logic analyser hardware."
url="https://lxtreme.nl/projects/ols/"
license=('GPL')
depends=('java-runtime')
source=(https://lxtreme.nl/ols/${pkgname}-${pkgver}-full.tar.gz
        ${pkgname}
        ${pkgname}.desktop
        ${pkgname}.png)
arch=('any')
install=${pkgname}.install
md5sums=('4dc1a573b9daa94e0c0be2b76f47967d'
         '7503e8fd7b6d99a916eaf8a68378224b'
         '019dda14116456715fb6d16d1ac4bdc8'
         'e22239705b9b8e6c29a5058ab863aa2b')
		 
package() {
  cd "${srcdir}"
  install -D -m755 ${pkgname} "${pkgdir}"/usr/bin/logic_sniffer
  install -D -m644 ${pkgname}.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop
  install -D -m644 ${pkgname}.png "${pkgdir}"/opt/${pkgname}/${pkgname}.png
  cd "${srcdir}"/${pkgname}-${pkgver}
  cp -ax * "${pkgdir}"/opt/${pkgname}
  rm "${pkgdir}"/opt/${pkgname}/run.bat
}
