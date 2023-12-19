# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: katt <magunasu.b97@gmail.com>
pkgname=godotpcktool-bin
pkgver=1.9
pkgrel=4
pkgdesc='Standalone tool for extracting and creating Godot .pck files'
arch=(x86_64)
url="https://github.com/hhyyrylainen/GodotPckTool"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source=(
    "${pkgname%-bin}-${pkgver}::${url}/releases/download/v${pkgver}/${pkgname%-bin}"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/hhyyrylainen/GodotPckTool/v${pkgver}/LICENSE"
)
sha256sums=('bd34659871555b531a15b12e51734c65ac0e60eae1eb20f803e48ae5997ad194'
            '0c202bb6463a8ce09bbeb102683ef12894dc361c28468e57bd3a4000a69a2640')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}" "${pkgdir}/usr/bin/${pkgname%-bin}"
	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}