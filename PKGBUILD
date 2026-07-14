# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: katt <magunasu.b97@gmail.com>
pkgname=godotpcktool-bin
pkgver=2.3
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
sha256sums=('1add2c22aeacdd7a8372288c885ed0ff4d2f673787aed924c54522a0f000d655'
            'a902ccaf62c6de93edac03729dcfd860e7d00ece3e829119cc5609902f8e74d2')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}" "${pkgdir}/usr/bin/${pkgname%-bin}"
	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
