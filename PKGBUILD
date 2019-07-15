# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=jetbrains-toolbox
pkgver=1.15.5605
pkgrel=1
pkgdesc='Manage all your JetBrains Projects and Tools'
arch=('x86_64' 'i686')
url='http://www.jetbrains.com/toolbox/'
license=('Commercial')
depends=('java-runtime>=8' 'fuse' 'glib2' 'libxslt' 'libxss')
options=('!strip')
source=(https://download.jetbrains.com/toolbox/${pkgname}-${pkgver}.tar.gz
        jetbrains-toolbox.desktop)
sha512sums=('e8b357c3473dafeb3b0d0fe8be4a5ef30ba1da2cb53c842810a0950abb4109e4bb5a20841dec30f0ce6a5402e1c1a31eb9d795a38a30f2946a6d269ba4a78153'
            '727b6378a8e3803c552ccae2c0d252eb8e79d213eabeecbd00bc25352cd0ffc6f53abaabf016688136822a65a76b2838f99e909931c21f49382934332446d1b4')

package() {
  install -d -m 755 "${pkgdir}/usr/bin/"

  install -D -m 644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m 755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/opt/${pkgname}/${pkgname}"

  ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
