# Maintainer: Patryk Kurdziel <patryk.kurdziel@protonmail.com>

_pkgname=music-discord-rpc
pkgname="${_pkgname}-bin"
pkgver=0.7.0
pkgrel=1
pkgdesc='Cross-platform Discord rich presence for music with album cover and progress bar support.'
url="https://github.com/patryk-ku/${_pkgname}"
license=('MIT')
arch=('x86_64')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}-v${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}"
	"${_pkgname}-v${pkgver}.service::https://raw.githubusercontent.com/patryk-ku/${_pkgname}/refs/tags/v${pkgver}/${_pkgname}.service"
	"LICENSE-v${pkgver}::https://raw.githubusercontent.com/patryk-ku/${_pkgname}/refs/tags/v${pkgver}/LICENSE")
sha512sums=('30fab54e8f813362f2a777fff5890884fdd11420c48f287fc131bc64b6592f3637e62a773b84295f1e18d2b5b1f726b77add9d8b9cab51646bee4861d51f4172'
            'f33f444bcfcc428d55a509cc115fcd848954bcfd8f1f76badf42b9fd52f8ce5645e97a23d6cfadb9a7ceb46a2d4fafc2d97a0647cba808e9d40690dd0e051d1b'
            'a15ba24d809a02858bb8608f832c5505175c937649ee45e985494bc503c3ec97b8df5fad01073017d2874bc93eece55f84c8eabb35dc27f69c1923d058041fbb')

package() {
	install -Dm755 "${_pkgname}-v${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 "${_pkgname}-v${pkgver}.service" "${pkgdir}/usr/lib/systemd/user/${_pkgname}.service"
	install -Dm644 "LICENSE-v${pkgver}" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
