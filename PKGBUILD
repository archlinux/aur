# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=jetbrains-toolbox
pkgver=1.16.6067
pkgrel=1
pkgdesc='Manage all your JetBrains Projects and Tools'
arch=('x86_64' 'i686')
url='http://www.jetbrains.com/toolbox/'
license=('Commercial')
depends=('java-runtime>=8' 'fuse' 'glib2' 'libxslt' 'libxss')
options=('!strip')
source=("https://download.jetbrains.com/toolbox/${pkgname}-${pkgver}.tar.gz"
        jetbrains-toolbox.desktop)
sha512sums=('072c23490e371f13b9a16185fcd1eb85f720bc6739ecf99b9e6b8a5fed505903fbeafa4cfa3a781999d7d8c70621741a09f6f72095eafd4b4b4036d847e28065'
            '81456c724cc424d78f209ba6a0ba925f3aec6d5b01569f481745090d06bf2635f7dd0d05e2ad9e2bba9e2185ec5f606c97374d1e0fd6e92349ad3a7d6b9237db')

package() {
  install -dm755 "${pkgdir}"/usr/bin/
  install -Dm644 "${srcdir}"/${pkgname}.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop
  install -Dm755 "${srcdir}"/${pkgname}-${pkgver}/${pkgname} "${pkgdir}"/opt/${pkgname}/${pkgname}

  ln -s /opt/${pkgname}/${pkgname} "${pkgdir}"/usr/bin/${pkgname}
}
