# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=jetbrains-toolbox
pkgver=1.0.1653
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
sha512sums=('69cdf800481dbfacbf0065426fc649e6a108657ababa766499a76cb2fc52ea16b040629e57d1b71b4673dec95505c350b2e113d418442a77094199ad0cfbe4af')

package() {
  install -d -m 755 ${pkgdir}/opt/${pkgname}
  install -d -m 755 ${pkgdir}/usr/bin/

  install -D -m 755 ${srcdir}/${pkgname}-${pkgver}/${pkgname} ${pkgdir}/opt/${pkgname}/${pkgname}

  ln -s /opt/${pkgname}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
