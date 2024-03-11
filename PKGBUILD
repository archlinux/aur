# Maintainer: Zosoled <zosoled@codecow.xyz>

pkgname=ledger-live-desktop-appimage
_pkgname=${pkgname%%-appimage}
pkgdesc="Desktop companion app for Ledger hardware wallets."
pkgver=2.77.2
pkgrel=1
arch=('x86_64')
url="https://www.ledger.com/ledger-live"
license=('MIT')
options=(!strip libtool staticlibs)

source=(
	${_pkgname}.AppImage::https://download.live.ledger.com/${_pkgname}-${pkgver}-linux-x86_64.AppImage
	${_pkgname}.png
	${_pkgname}.desktop
)

# https://www.ledger.com/ledger-live/lld-signatures
sha512sums=(
	'e5ee159d2030d5743a67c37be8fef56eb0ed8b78fbf33ccffbd6171c65a2bd23db58f6bca13b22334347a7dcbaf6b50d948d6d7e628789cee289bd8440e66056'
	'SKIP'
	'SKIP'
)

package() {
	cd ${srcdir}
	install -Dm 755 ${_pkgname}.AppImage ${pkgdir}/opt/${_pkgname}.AppImage
	install -Dm 644 ${_pkgname}.png ${pkgdir}/usr/share/icons/${_pkgname}.png
	install -Dm 644 ${_pkgname}.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop
}
