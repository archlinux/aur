# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=0xjuanma
_pkgname=golazo
pkgname=${_pkgname}-bin
pkgver=0.32.0
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="Terminal app for keeping up with live football/soccer. Check scores, match events, and stats from major leagues without leaving your terminal"
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "NOTIFICATIONS-${pkgver}.md::${_urlraw}/docs/NOTIFICATIONS.md"
        "SUPPORTED_LEAGUES-${pkgver}.md::${_urlraw}/docs/SUPPORTED_LEAGUES.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[1]}")
sha256sums=('4dc0a5daa325b37f64f50f726db4dd94342dcfec49bd0fe80266a0ef59953bfa'
            'e95267972caca184cd7372045efc6a91d61a3e874bc2673019e3a849310bda94'
            'e5f43b842f617dab500772337c78cbb95429d364a5bb8b70f6e7810f1786d67f'
            '06fa00c0413173af0fdf7f39d9b4f1faf268363a394d389c83f20161e6f4aa57')
sha256sums_x86_64=('f618bd7c757f944e66418c763ee94b2313628668b23cbbf521ef741a979f0b81')
sha256sums_aarch64=('05db681e706843e2afacc11c54c4c838c39f127ff69e26d7ae9326c4591feb91')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "NOTIFICATIONS-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/NOTIFICATIONS.md"
	install -Dm644 "SUPPORTED_LEAGUES-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/SUPPORTED_LEAGUES.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
