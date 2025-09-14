# Maintainer: Patryk Kurdziel <patryk.kurdziel@protonmail.com>

_pkgname=music-discord-rpc
pkgname="${_pkgname}-bin"
pkgver=0.6.2
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
sha512sums=('09c8bed4671f95c0a6076926ef9222cb0218944bb7062d8f0337a3ffe524e626032091bab57abae570ce64b0237a07c12d526350b73c9c35c7a020e681a9cb9f'
            'f33f444bcfcc428d55a509cc115fcd848954bcfd8f1f76badf42b9fd52f8ce5645e97a23d6cfadb9a7ceb46a2d4fafc2d97a0647cba808e9d40690dd0e051d1b'
            'c2b16df74d9a4a258961ae1d9b67bd222bf3133a36e0e8425b83163b9fd8c68e9c5df7f23c41067e80ae2639e0d3d1b0235708cb097f2213a6e80882aebd14d2')

package() {
	install -Dm755 "${_pkgname}-v${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 "${_pkgname}-v${pkgver}.service" "${pkgdir}/usr/lib/systemd/user/${_pkgname}.service"
	install -Dm644 "LICENSE-v${pkgver}" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
