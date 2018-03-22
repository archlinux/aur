# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=jetbrains-toolbox
pkgver=1.8.3678
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
sha512sums=('dfec080f43d20437e8df10ddfc7c8ec0cdfda98a6bde08ed2757575afe8f60a8c2cffd01432a02d0c4b7375e4a2e5d1b2b3e39d689a4ea5bacfb1218ef0d1705'
            '727b6378a8e3803c552ccae2c0d252eb8e79d213eabeecbd00bc25352cd0ffc6f53abaabf016688136822a65a76b2838f99e909931c21f49382934332446d1b4')

package() {
  install -d -m 755 "${pkgdir}/usr/bin/"

  install -D -m 644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m 755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/opt/${pkgname}/${pkgname}"

  ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
