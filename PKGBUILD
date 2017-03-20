# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=jetbrains-toolbox
pkgver=1.2.2314
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
sha512sums=('be41558d24b22a1605bb2cfeb5469d02ce7e9931e331c120fe212cb885af9425354bce05c299436f1fcd083ed5ea5a8ce4b019c8ccf40db745c13ee4ced64006')

package() {
  install -d -m 755 ${pkgdir}/opt/${pkgname}
  install -d -m 755 ${pkgdir}/usr/bin/

  install -D -m 755 ${srcdir}/${pkgname}-${pkgver}/${pkgname} ${pkgdir}/opt/${pkgname}/${pkgname}

  ln -s /opt/${pkgname}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
