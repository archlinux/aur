# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=jetbrains-toolbox
pkgver=1.2.2259
pkgrel=1
pkgdesc='Manage all your JetBrains Projects and Tools'
arch=('x86_64' 'i686')
license=('Commercial')
url='http://www.jetbrains.com/toolbox/'
options=('!strip')
depends=('fuse')
optdepends=('java-environment>=8: use system java'
            'java-runtime-common: use system java')
source=(https://download.jetbrains.com/toolbox/${pkgname}-${pkgver}.tar.gz)
sha512sums=('7c37bb7cea4450af3d1985d1a3572b2f5ebdde82446bbf15bb96cc6df1f9353c799b02f66bbba977f7aeac89cfef5969ea7d90aa1eed38872580f7ecb31ba823')

package() {
  install -d -m 755 ${pkgdir}/opt/${pkgname}
  install -d -m 755 ${pkgdir}/usr/bin/

  install -D -m 755 ${srcdir}/${pkgname}-${pkgver}/${pkgname} ${pkgdir}/opt/${pkgname}/${pkgname}

  ln -s /opt/${pkgname}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
