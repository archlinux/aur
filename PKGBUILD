# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=jetbrains-toolbox
pkgver=1.1.2143
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
sha512sums=('f7ba01c08f5438fa59fcd1760424081045810889fa73be64e51fea0f2f3fc67c56b83bb16ee1cb017a4f2d296894211cd63a6149b1fb1113b5252668eb97607c')

package() {
  install -d -m 755 ${pkgdir}/opt/${pkgname}
  install -d -m 755 ${pkgdir}/usr/bin/

  install -D -m 755 ${srcdir}/${pkgname}-${pkgver}/${pkgname} ${pkgdir}/opt/${pkgname}/${pkgname}

  ln -s /opt/${pkgname}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
