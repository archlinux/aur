# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=jetbrains-toolbox
pkgver=1.7.3593
pkgrel=1
pkgdesc='Manage all your JetBrains Projects and Tools'
arch=('x86_64' 'i686')
url='http://www.jetbrains.com/toolbox/'
license=('Commercial')
depends=('fuse' 'glib2' 'libxslt' 'libxss')
optdepends=('java-environment>=8: use system java'
            'java-runtime-common: use system java')
options=('!strip')
source=(https://download.jetbrains.com/toolbox/${pkgname}-${pkgver}.tar.gz
        jetbrains-toolbox.desktop)
sha512sums=('76da749bea364d78ec272a98cc9a830ba05ca3f0896cc7f2bd4114b307facebb7df8c8fb304f4fe7966a3287d57bd59b5c0adf68bcbe1f297422ce61e2010e2e'
            '727b6378a8e3803c552ccae2c0d252eb8e79d213eabeecbd00bc25352cd0ffc6f53abaabf016688136822a65a76b2838f99e909931c21f49382934332446d1b4')

package() {
  install -d -m 755 "${pkgdir}/usr/bin/"

  install -D -m 644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m 755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/opt/${pkgname}/${pkgname}"

  ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
