# Contributor: Henrik Hodne <henrik@hodne.io>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgbase=otf-fira-code
pkgname=('otf-fira-code' 'ttf-fira-code')
pkgver=1.200
pkgrel=1
pkgdesc="monospaced font with programming ligatures"
arch=(any)
depends=(fontconfig xorg-font-utils)
source=(https://github.com/tonsky/FiraCode/archive/${pkgver}.tar.gz)
sha256sums=('4b7a4da9cdcbde4bb7b7f2df9e6d278d86d933be603867ae1ca844a43138c0b1')
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
