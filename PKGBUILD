# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=jetbrains-toolbox
pkgver=1.13.4733
pkgrel=1
pkgdesc='Manage all your JetBrains Projects and Tools'
arch=('x86_64' 'i686')
url='http://www.jetbrains.com/toolbox/'
license=('Commercial')
depends=('java-runtime>=8' 'fuse' 'glib2' 'libxslt' 'libxss')
options=('!strip')
source=(https://download.jetbrains.com/toolbox/${pkgname}-${pkgver}.tar.gz
        jetbrains-toolbox.desktop)
sha512sums=('079a35b782df76494f97ef99977997a14039d6bf50c43290c1f905a68b5c7a13f1b426af1097e86becf73d56abb4eec75c985c02723bc10d4861ea7c7f5e34b8'
            '727b6378a8e3803c552ccae2c0d252eb8e79d213eabeecbd00bc25352cd0ffc6f53abaabf016688136822a65a76b2838f99e909931c21f49382934332446d1b4')

package() {
  install -d -m 755 "${pkgdir}/usr/bin/"

  install -D -m 644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m 755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/opt/${pkgname}/${pkgname}"

  ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
