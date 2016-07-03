# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=jetbrains-toolbox
pkgver=1.0.1569
pkgrel=1
pkgdesc="Manage all your JetBrains Projects and Tools"
arch=('x86_64' 'i686')
options=('!strip')
url="http://www.jetbrains.com/${pkgname}/"
license=('Commercial')
optdepends=('java-environment>=8: use system java'
            'java-runtime-common: use system java')
source=(https://download.jetbrains.com/toolbox/${pkgname}-${pkgver}.tar.gz)
sha512sums=('fb100513049e68abe9ed04b1bd127f9662fd84999b2931e2bd80ea34cfaca53b14c72c1bb4042d5b037ed4c6ad7083f1c85771a1b5f50c4641b000947f1c5e3a')

package() {
  install -d -m 755 ${pkgdir}/opt/${pkgname}
  install -d -m 755 ${pkgdir}/usr/bin/

  install -D -m 755 ${srcdir}/${pkgname}-${pkgver}/${pkgname} ${pkgdir}/opt/${pkgname}/${pkgname}

  ln -s /opt/${pkgname}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
