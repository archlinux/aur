# Contributor: Henrik Hodne <henrik@hodne.io>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgbase=otf-fira-code
pkgname=('otf-fira-code' 'ttf-fira-code')
pkgver=1.203
pkgrel=1
pkgdesc="monospaced font with programming ligatures"
arch=('any')
depends=('fontconfig' 'xorg-font-utils')
source=(https://github.com/tonsky/FiraCode/archive/${pkgver}.tar.gz)
sha256sums=('7e73d710fa4214fcc54b230c156dcee233448e13e95cb554b04ef7ad9e7f0042')
install=${pkgname}.install
license=("custom: SIL Open Font License")

package_otf-fira-code() {
	install -d "${pkgdir}/usr/share/fonts/OTF"
	install -m644 "${srcdir}/FiraCode-${pkgver}/"distr/otf/*.otf "${pkgdir}/usr/share/fonts/OTF/"
	install -D -m644 "${srcdir}/FiraCode-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname[0]}/LICENSE"
}

package_ttf-fira-code() {
	install -d "${pkgdir}/usr/share/fonts/TTF"
	install -m644 "${srcdir}/FiraCode-${pkgver}/"distr/ttf/*.ttf "${pkgdir}/usr/share/fonts/TTF/"
	install -D -m644 "${srcdir}/FiraCode-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname[1]}/LICENSE"
}
