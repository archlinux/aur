# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>
# Contributor: Michael Straube <michael_straube web de>
# Contributor: Etzos <supercodingmonkey @ gmail.com>
# Contributor: Gordin <9ordin @t gmail dot com>
# Contributor: Geequlim <geequlim@gmail.com>
# Contributor: Antti Juhani Oja <antti.oja@gmail.com>

pkgname=spriteilluminator
pkgver=1.5.4
pkgrel=2
pkgdesc="Tool for creating Normal Maps, also known as Dot3 Bump Maps, which generate a 2.5D effect in different game engines including Cocos2D-X"
arch=('x86_64')
url="http://www.codeandweb.com/spriteilluminator"
license=("custom:$pkgname")
install="$pkgname.install"
depends=('hicolor-icon-theme'
         'desktop-file-utils'
         'grantlee'
         'gcc-libs-multilib'
         'qt5-svg'
         'qt5-imageformats'
         'qt5-quickcontrols'
         'qt5-wayland'
         'qt5-quickcontrols2'
         'qt5-xmlpatterns')
options=('!strip')
source=("${pkgname}-${pkgver}.deb::https://www.codeandweb.com/download/$pkgname/${pkgver}/SpriteIlluminator-${pkgver}-ubuntu64.deb")
sha256sums=('0498c4d058d30ec42b241b6a86c53e9ecf183bd80cb64b691e54b347ea7f4156')

package() {
  cd "${srcdir}"
  tar xJf data.tar.xz -C "${pkgdir}"
  install -Dm644 "${pkgdir}/usr/share/$pkgname/documents/LicenseAgreement.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}