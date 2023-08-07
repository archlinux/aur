# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: katt <magunasu.b97@gmail.com>
pkgname=godotpcktool-bin
pkgver=1.9
pkgrel=1
pkgdesc='Standalone tool for extracting and creating Godot .pck files'
arch=(x86_64)
url="https://github.com/hhyyrylainen/GodotPckTool"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}-${pkgver}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}::${url}/releases/download/v${pkgver}/${pkgname%-bin}"
		"LICENSE::${url}/raw/master/LICENSE")
sha256sums=('bd34659871555b531a15b12e51734c65ac0e60eae1eb20f803e48ae5997ad194'
            'e7aa093a8808143fe8420f3f8cad50adb4b5db1b99829cbf0742b2dfd182fbdb')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}" "${pkgdir}/usr/bin/${pkgname%-bin}"
	install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}