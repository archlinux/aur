# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=jetbrains-toolbox
pkgver=1.14.5037
pkgrel=1
pkgdesc='Manage all your JetBrains Projects and Tools'
arch=('x86_64' 'i686')
url='http://www.jetbrains.com/toolbox/'
license=('Commercial')
depends=('java-runtime>=8' 'fuse' 'glib2' 'libxslt' 'libxss')
options=('!strip')
source=(https://download.jetbrains.com/toolbox/${pkgname}-${pkgver}.tar.gz
        jetbrains-toolbox.desktop)
sha512sums=('6e32fd034ea5c194929f308d0b1aab0856319703dae732aa3c84da89c4018e16f034399d5f9e72487f3545c83f41b4d8a889dff7ea3aa8d0b0a6e5278c0eaacb'
            '727b6378a8e3803c552ccae2c0d252eb8e79d213eabeecbd00bc25352cd0ffc6f53abaabf016688136822a65a76b2838f99e909931c21f49382934332446d1b4')

package() {
  install -d -m 755 "${pkgdir}/usr/bin/"

  install -D -m 644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m 755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/opt/${pkgname}/${pkgname}"

  ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
