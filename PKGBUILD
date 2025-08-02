# Maintainer: Patryk Kurdziel <patryk.kurdziel@protonmail.com>

_pkgname=mpris-discord-rpc
pkgname="${_pkgname}-bin"
pkgver=0.5.1
pkgrel=1
pkgdesc='Linux Discord rich presence for music, using MPRIS with album cover and progress bar support.'
url="https://github.com/patryk-ku/${_pkgname}"
license=('MIT')
arch=('x86_64')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}-v${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}"
        "${_pkgname}-v${pkgver}.service::https://raw.githubusercontent.com/patryk-ku/${_pkgname}/refs/tags/v${pkgver}/${_pkgname}.service"
        "LICENSE-v${pkgver}::https://raw.githubusercontent.com/patryk-ku/${_pkgname}/refs/tags/v${pkgver}/LICENSE")
sha512sums=('8b03f938351a5496903479f34db4882b6915a2813ed6e64047c6713ea9913bbbdb736fbbb3de9aab1010ef7a82813fd41cede2fdd01d9c1f8e2bebce9e0fb067'
            '581c0280da85b9d3133e89128043acb22829a24e0bcd767214f72f48e16a00160c7d74ab4d4f9323d0bb708c32e68532f9d7bcaa15bece249450e497025a7a8a'
            'c2b16df74d9a4a258961ae1d9b67bd222bf3133a36e0e8425b83163b9fd8c68e9c5df7f23c41067e80ae2639e0d3d1b0235708cb097f2213a6e80882aebd14d2')

package() {
	install -Dm755 "${_pkgname}-v${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 "${_pkgname}-v${pkgver}.service" "${pkgdir}/usr/lib/systemd/user/${_pkgname}.service"
	install -Dm644 "LICENSE-v${pkgver}" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
