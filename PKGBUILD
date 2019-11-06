# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=jetbrains-toolbox
pkgver=1.16.6016
pkgrel=1
pkgdesc='Manage all your JetBrains Projects and Tools'
arch=('x86_64' 'i686')
url='http://www.jetbrains.com/toolbox/'
license=('Commercial')
depends=('java-runtime>=8' 'fuse' 'glib2' 'libxslt' 'libxss')
options=('!strip')
source=("https://download.jetbrains.com/toolbox/${pkgname}-${pkgver}.tar.gz"
        jetbrains-toolbox.desktop)
sha512sums=('cf5dd392e38b6229924a03262c9aef4a4c8bb359ba8f2c073e00a47553a411d032d66eba9351de5edf89c3dafa3aa7149450a0b739a21c9d7b6588ab02cf759e'
            '81456c724cc424d78f209ba6a0ba925f3aec6d5b01569f481745090d06bf2635f7dd0d05e2ad9e2bba9e2185ec5f606c97374d1e0fd6e92349ad3a7d6b9237db')

package() {
  install -dm755 "${pkgdir}"/usr/bin/
  install -Dm644 "${srcdir}"/${pkgname}.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop
  install -Dm755 "${srcdir}"/${pkgname}-${pkgver}/${pkgname} "${pkgdir}"/opt/${pkgname}/${pkgname}

  ln -s /opt/${pkgname}/${pkgname} "${pkgdir}"/usr/bin/${pkgname}
}
