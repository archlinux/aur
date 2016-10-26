# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=jetbrains-toolbox
pkgver=1.0.2095
pkgrel=1
pkgdesc="Manage all your JetBrains Projects and Tools"
arch=('x86_64' 'i686')
options=('!strip')
url="http://www.jetbrains.com/toolbox/"
license=('Commercial')
depends=('fuse')
optdepends=('java-environment>=8: use system java'
            'java-runtime-common: use system java')
source=(https://download.jetbrains.com/toolbox/${pkgname}-${pkgver}.tar.gz)
sha512sums=('04e98baf2609f754563e6ab5e5e1ce28f84cd435f67bdbb6b6e3dbca38d94fa32380ae8c6e0907beed0dad3688c4c40330f13873a9fdd3b82eff936c1afe4c78')

package() {
  install -d -m 755 ${pkgdir}/opt/${pkgname}
  install -d -m 755 ${pkgdir}/usr/bin/

  install -D -m 755 ${srcdir}/${pkgname}-${pkgver}/${pkgname} ${pkgdir}/opt/${pkgname}/${pkgname}

  ln -s /opt/${pkgname}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
