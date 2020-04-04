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
url="http://www.codeandweb.com/$pkgname"
license=("custom:$pkgname")
install="$pkgname.install"
depends=('shared-mime-info'
         'hicolor-icon-theme'
         'desktop-file-utils'
         'grantlee'
		 'gcc-libs-multilib'
         'qt5-svg'
         'qt5-declarative'
         'qt5-imageformats'
		 'qt5-quickcontrols')
source=("https://www.codeandweb.com/download/$pkgname/${pkgver}/SpriteIlluminator-${pkgver}-ubuntu64.deb")
md5sums=('b27053836c535d8ebd2daf83881e197e')

prepare() {
  ar -x "SpriteIlluminator-${pkgver}-ubuntu64.deb"
}

package() {
  cd "${srcdir}"
  tar xJf data.tar.xz -C "${pkgdir}"
  install -Dm644 "${pkgdir}/usr/share/$pkgname/documents/LicenseAgreement.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}