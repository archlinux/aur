# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>
# Contributor: Michael Straube <michael_straube web de>
# Contributor: Etzos <supercodingmonkey @ gmail.com>
# Contributor: Gordin <9ordin @t gmail dot com>
# Contributor: Geequlim <geequlim@gmail.com>
# Contributor: Antti Juhani Oja <antti.oja@gmail.com>

pkgname=spriteilluminator
pkgver=2.1.2
pkgrel=1
pkgdesc="Tool for creating Normal Maps, also known as Dot3 Bump Maps, which generate a 2.5D effect in different game engines including Cocos2D-X"
arch=('x86_64')
url="http://www.codeandweb.com/spriteilluminator"
license=("custom:$pkgname")
install="$pkgname.install"
depends=(
  hicolor-icon-theme
  desktop-file-utils
  gcc-libs-multilib
  qt5-base
  qt5-svg
  qt5-wayland
  qt5-declarative
  qt5-quickcontrols2
)
options=('!strip')
source=("${pkgname}-${pkgver}.deb::https://www.codeandweb.com/download/$pkgname/${pkgver}/SpriteIlluminator-${pkgver}.deb")
sha256sums=('1d34ff6ebfc778cc3cc02790f77568a26667e4a2b9f0fcac5241409fd93cece3')

package() {
  cd "${srcdir}"
  bsdtar -xf data.tar.* -C "$pkgdir"
  install -Dm644 "${pkgdir}/usr/share/$pkgname/documents/LicenseAgreement.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
