# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: katt <magunasu.b97@gmail.com>
pkgname=godotpcktool-bin
pkgver=2.0
pkgrel=1
pkgdesc='Standalone tool for extracting and creating Godot .pck files'
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
sha256sums=('7afe5d829f0b2d8c8578e82d81f3558ab09ebf5c9d8d6868aa885dd14f4e9317'
            'e2773f6d42f08327a3d019fc6f797f05a4095297cfba80696ea592dda9dee3c2')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}" "${pkgdir}/usr/bin/${pkgname%-bin}"
	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}