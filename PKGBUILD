# Maintainer: Robbie <zoqaeski AT gmail DOT com>

pkgname=otf-fira-fonts
pkgver=4.202
pkgrel=1
pkgdesc="Mozilla's new typeface, used in Firefox OS"
arch=(any)
depends=(fontconfig xorg-font-utils)
source=(https://github.com/mozilla/Fira/archive/4.202.tar.gz)
url="http://mozilla.github.io/Fira/"
license=("custom: SIL Open Font License")
sha256sums=('d86269657387f144d77ba12011124f30f423f70672e1576dc16f918bb16ddfe4')
provides=(otf-fira-sans otf-fira-mono)
conflicts=(otf-fira-mono otf-fira-sans ttf-fira-sans ttf-fira-mono)

package() {
	install -d "${pkgdir}/usr/share/fonts/OTF"
	install -m644 "${srcdir}/Fira-${pkgver}/otf/"*.otf "${pkgdir}/usr/share/fonts/OTF/"
	install -D -m644 "${srcdir}/Fira-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
