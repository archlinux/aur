# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=jetbrains-toolbox
pkgver=1.16.6319
pkgrel=1
pkgdesc='Manage all your JetBrains Projects and Tools'
arch=('x86_64' 'i686')
url='http://www.jetbrains.com/toolbox/'
license=('commercial')
depends=('java-runtime>=8' 'fuse' 'glib2' 'libxslt' 'libxss')
options=('!strip')
source=("https://download.jetbrains.com/toolbox/${pkgname}-${pkgver}.tar.gz"
        jetbrains-toolbox.desktop
        LICENSE)
sha512sums=('66f5f12b07781bdb8cd54a288e9548cf41475c8af21de19543fc973ac73c1644c9f26b21a61c6eb572309f6d37e39c32713367c7286564b3f94b077d752943fd'
            '81456c724cc424d78f209ba6a0ba925f3aec6d5b01569f481745090d06bf2635f7dd0d05e2ad9e2bba9e2185ec5f606c97374d1e0fd6e92349ad3a7d6b9237db'
            'e2aaaa75571f368f85bcc4baef27cc502781ce382bf04737763b07244716918fc2f0eb0b78b02631e242c9a5c246b27d720bb28556fc64bbde213403b7bf57f6')

package() {
  install -dm755 "${pkgdir}"/usr/bin/
  install -Dm644 "${srcdir}"/${pkgname}.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop
  install -Dm755 "${srcdir}"/${pkgname}-${pkgver}/${pkgname} "${pkgdir}"/opt/${pkgname}/${pkgname}
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.txt

  ln -s /opt/${pkgname}/${pkgname} "${pkgdir}"/usr/bin/${pkgname}
}
