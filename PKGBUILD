# Maintainer: Sebastian Wolf <fatmike303 at gmail dot com>
pkgname=ttf-c64
pkgver=1.2.1
pkgrel=1
pkgdesc="The best available C64 TrueType representation to date"
arch=('any')
url="http://style64.org/c64-truetype"
license=('http://style64.org/c64-truetype/license')
depends=('fontconfig' 'xorg-font-utils')
source=(http://style64.org/file/C64_TrueType_v${pkgver}-STYLE.zip)
install=$pkgname.install
sha256sums=('b630ff545df6fed324bd9b6dc7336b7b93e8777668f45cbb3679561f9960ef2d')

package() {
#	mkdir -p $pkgdir/usr/share/fonts/TTF
	install -D -m644 "${srcdir}/C64_TrueType_v$pkgver-STYLE/fonts/C64_Pro_Mono-STYLE.ttf" "${pkgdir}/usr/share/fonts/TTF/c64_pro_mono.ttf" || return 1
	install -D -m644 "${srcdir}/C64_TrueType_v$pkgver-STYLE/fonts/C64_Pro-STYLE.ttf" "${pkgdir}/usr/share/fonts/TTF/c64_pro.ttf" || return 1
	install -D -m644 $srcdir/C64_TrueType_v$pkgver-STYLE/license.txt "${pkgdir}/usr/share/licenses/ttf-c64/LICENSE" || return 1
}
