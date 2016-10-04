# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=jetbrains-toolbox
pkgver=1.0.2002
pkgrel=1
pkgdesc="Manage all your JetBrains Projects and Tools"
arch=('x86_64' 'i686')
options=('!strip')
url="http://www.jetbrains.com/${pkgname}/"
license=('Commercial')
depends=('fuse')
optdepends=('java-environment>=8: use system java'
            'java-runtime-common: use system java')
source=(https://download.jetbrains.com/toolbox/${pkgname}-${pkgver}.tar.gz)
sha512sums=('07f460cf51e116cd54bec76f95f16c6b6c947155104b99ddc0880a1b039c5812db54fd2d5339f1bb386df5398b8720da24414cba1fa72cc2abe39fdc9141852a')

package() {
  install -d -m 755 ${pkgdir}/opt/${pkgname}
  install -d -m 755 ${pkgdir}/usr/bin/

  install -D -m 755 ${srcdir}/${pkgname}-${pkgver}/${pkgname} ${pkgdir}/opt/${pkgname}/${pkgname}

  ln -s /opt/${pkgname}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
