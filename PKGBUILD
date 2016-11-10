# Contributor: Henrik Hodne <henrik@hodne.io>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgbase=otf-fira-code
pkgname=('otf-fira-code' 'ttf-fira-code')
pkgver=1.204
pkgrel=1
pkgdesc="monospaced font with programming ligatures"
arch=('any')
depends=('fontconfig' 'xorg-font-utils')
source=($pkgname-$pkgver.tar.gz::https://github.com/tonsky/FiraCode/archive/${pkgver}.tar.gz)
sha256sums=('18747eed28dcc65cc4fa4bfe9a61358dd96f148d2cbc50d61b4f7172aeb13312')
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
