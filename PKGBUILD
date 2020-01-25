# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=jetbrains-toolbox
pkgver=1.16.6319
pkgrel=2
pkgdesc='Manage all your JetBrains Projects and Tools'
arch=('x86_64' 'i686')
url='http://www.jetbrains.com/toolbox/'
license=('commercial')
depends=('java-runtime>=8' 'fuse' 'glib2' 'libxslt' 'libxss')
options=('!strip')
source=("https://download.jetbrains.com/toolbox/${pkgname}-${pkgver}.tar.gz"
        jetbrains-toolbox.desktop
        icon.svg
        LICENSE)
sha512sums=('66f5f12b07781bdb8cd54a288e9548cf41475c8af21de19543fc973ac73c1644c9f26b21a61c6eb572309f6d37e39c32713367c7286564b3f94b077d752943fd'
            'e33e089dc3b8f4556ea04090daeea0abca486f2c799a2c2250209ac09c713f35b53b98196affc6ab0f5713d8810f7b9fd55e7c85e2a0edb138c2da97d634f652'
            'd3f98b0cd0ec3dd4e687165588d9466196d057f579882411efc0ab9092716e05317f9eabb0262fb53bbbf5692c9f6506d9f2acea9863aeb2499094d7844cf533'
            'e2aaaa75571f368f85bcc4baef27cc502781ce382bf04737763b07244716918fc2f0eb0b78b02631e242c9a5c246b27d720bb28556fc64bbde213403b7bf57f6')

package() {
  install -dm755 "${pkgdir}"/usr/bin/
  install -Dm644 "${srcdir}"/${pkgname}.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop
  install -Dm644 "${srcdir}"/icon.svg "${pkgdir}"/opt/jetbrains-toolbox/${pkgbase}.svg
  install -Dm755 "${srcdir}"/${pkgname}-${pkgver}/${pkgname} "${pkgdir}"/opt/${pkgname}/${pkgname}
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.txt

  ln -s /opt/${pkgname}/${pkgname} "${pkgdir}"/usr/bin/${pkgname}
}
