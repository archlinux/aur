# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=jetbrains-toolbox
pkgver=1.3.2421
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
sha512sums=('de41175bd83b68b9779ec02e2b43078b421e2b5b8cc32bd1b0f20230ef139734ce73bdb3a5321ead00fe42572976282a5f99b3fa2eec6d9145843bcd50ff8a13')

package() {
  install -d -m 755 "${pkgdir}/opt/${pkgname}"
  install -d -m 755 "${pkgdir}/usr/bin/"

  install -D -m 755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/opt/${pkgname}/${pkgname}"

  ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
