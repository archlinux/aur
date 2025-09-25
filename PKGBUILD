# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: katt <magunasu.b97@gmail.com>
pkgname=godotpcktool-bin
pkgver=2.2
pkgrel=1
pkgdesc='Standalone tool for extracting and creating Godot .pck files.(Written in Go,prebuilt version)'
arch=(x86_64)
url="https://github.com/hhyyrylainen/GodotPckTool"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'glibc'
)
source=(
    "${pkgname%-bin}-${pkgver}::${url}/releases/download/v${pkgver}/${pkgname%-bin}"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/hhyyrylainen/GodotPckTool/v${pkgver}/LICENSE"
)
sha256sums=('823e850a04dbaef4e9ecef8134813cefd6366c1ba90321cda7fc38ee1c96d097'
            '7e6371df71471ba5a53b67411be4b660f8a1656c4f6ef1134cf20504b4003b46')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}" "${pkgdir}/usr/bin/${pkgname%-bin}"
	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
