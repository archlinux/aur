# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>
# Contributor: Michael Straube <michael_straube web de>
# Contributor: Etzos <supercodingmonkey @ gmail.com>
# Contributor: Gordin <9ordin @t gmail dot com>
# Contributor: Geequlim <geequlim@gmail.com>
# Contributor: Antti Juhani Oja <antti.oja@gmail.com>

pkgname=spriteilluminator
pkgver=2.0.1
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
source=("${pkgname}-${pkgver}.deb::https://www.codeandweb.com/download/$pkgname/${pkgver}/SpriteIlluminator-${pkgver}.deb")
sha256sums=('28819e8ca6c3b7f0744c3fe4a7a2ad4e263a29a81e221de60aa3f38ed7aad5d3')

package() {
  cd "${srcdir}"
  tar xJf data.tar.xz -C "${pkgdir}"
  install -Dm644 "${pkgdir}/usr/share/$pkgname/documents/LicenseAgreement.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}