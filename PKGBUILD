# Maintainer: Patryk Kurdziel <patryk.kurdziel@protonmail.com>

pkgname=mpris-discord-rpc
pkgver=0.3.0
pkgrel=1
pkgdesc='Linux Discord rich presence for music, using MPRIS with album cover and progress bar support.'
url="https://github.com/patryk-ku/${pkgname}"
license=('MIT')
arch=('x86_64')
source=(
    "${pkgname}-v${pkgver}::${url}/releases/download/v${pkgver}/${pkgname}"
    "https://raw.githubusercontent.com/patryk-ku/${pkgname}/main/mpris-discord-rpc.service"
    "https://raw.githubusercontent.com/patryk-ku/${pkgname}/main/LICENSE"
)
sha512sums=(
    'e69f9a34e376d63021876416ab156c2ddb29abc7ab82f3d9a9ae7b3ae7ed4468d58e1d2bcf6b5a7aecb558b4d9135a7e8d7ae2fd912fa7ea0666722e22b47d4d'
    '581c0280da85b9d3133e89128043acb22829a24e0bcd767214f72f48e16a00160c7d74ab4d4f9323d0bb708c32e68532f9d7bcaa15bece249450e497025a7a8a'
    'c2b16df74d9a4a258961ae1d9b67bd222bf3133a36e0e8425b83163b9fd8c68e9c5df7f23c41067e80ae2639e0d3d1b0235708cb097f2213a6e80882aebd14d2'
)

package() {
	install -Dm755 "${pkgname}-v${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 mpris-discord-rpc.service "${pkgdir}/usr/lib/systemd/user/mpris-discord-rpc.service"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
