# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=ttf-lato
pkgver=2.010
pkgrel=1
pkgdesc='a sanserif type­face family'
url="http://www.latofonts.com/lato-free-fonts/"
license=('custom:OFL')
arch=('any')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
source=("${pkgname}-${pkgver}::http://www.latofonts.com/download/Lato2OFL.zip"
        'install')

install=install

package() {
	cd "${srcdir}/Lato2OFL"
	install -dm755 "${pkgdir}"/usr/share/fonts/TTF
	install -m644 *.ttf "${pkgdir}"/usr/share/fonts/TTF

	install -Dm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.txt "${pkgdir}/usr/share/doc/${pkgname}/README.txt"
	install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
}

sha256sums=('367c730f64f4d1731e4d3ef7da2dd27635999e4a2f7cab24cfdcaf42488644a4'
            'c98e5a09e552c01b479c22aafa101ea3e3237d3727fcad4629730762bdf4afa1')
