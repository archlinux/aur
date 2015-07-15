# Maintainer: N. Izumi aka izmntuk
pkgname=otf-russkopis
pkgdesc='A Free Cyrillic cursive font'
pkgrel=1
pkgver=0.0.1
url='https://github.com/MihailJP/Russkopis'
license=('custom')
arch=('any')
makedepends=('fontforge')
depends=('fontconfig' 'xorg-font-utils')
install=INSTALL
options=('!strip')
sha1sums=('b1262d685239005680d45dbfade147ca455adf77' 'SKIP')
source=('https://github.com/MihailJP/Russkopis/archive/'${pkgver}'.tar.gz' INSTALL)

build() {
	make -C "${srcdir}/Russkopis-${pkgver}"
}

package() {
	cd "${srcdir}/Russkopis-${pkgver}"
	install -d "${pkgdir}"/usr/share/{doc,licenses}/"${pkgname}" "${pkgdir}/usr/share/fonts/OTF"
	install -pm644 README{,.{ja,ru}.utf8} "${pkgdir}/usr/share/doc/${pkgname}"
	install -pm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
	install -pm644 Russkopis-{Normalny,Zhirny}.otf "${pkgdir}/usr/share/fonts/OTF"
}
