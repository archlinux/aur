# Maintainer: Patryk Kurdziel <patryk.kurdziel@protonmail.com>

_pkgname=mpris-discord-rpc
pkgname="${_pkgname}-bin"
pkgver=0.5.0
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
sha512sums=('18298fdda76d9f9c81d43ec4afacaf34c4509daf58d0b95124c58db35126203974d69e3ace62eaae5ce891ed9e3ff2025dc9ba7d59eb4058457d85cd59b01fef'
            '581c0280da85b9d3133e89128043acb22829a24e0bcd767214f72f48e16a00160c7d74ab4d4f9323d0bb708c32e68532f9d7bcaa15bece249450e497025a7a8a'
            'c2b16df74d9a4a258961ae1d9b67bd222bf3133a36e0e8425b83163b9fd8c68e9c5df7f23c41067e80ae2639e0d3d1b0235708cb097f2213a6e80882aebd14d2')

package() {
	install -Dm755 "${_pkgname}-v${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 "${_pkgname}-v${pkgver}.service" "${pkgdir}/usr/lib/systemd/user/${_pkgname}.service"
	install -Dm644 "LICENSE-v${pkgver}" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
