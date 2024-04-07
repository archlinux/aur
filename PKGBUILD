# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: yaa110 <yaa110@gmail.com>
pkgname=nomino-bin
pkgver=1.3.4
pkgrel=1
pkgdesc='Batch rename utility for developers'
arch=('x86_64')
url="https://github.com/yaa110/nomino"
license=(
	'Apache-2.0'
	'MIT'
)
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=()
source=(
	"${pkgname%-bin}-${pkgver}::${url}/releases/download/${pkgver}/${pkgname%-bin}-linux-64bit"
	"LICENSE-MIT-${pkgver}::https://raw.githubusercontent.com/yaa110/nomino/${pkgver}/LICENSE-MIT"
	"LICENSE-APACHE-${pkgver}::https://raw.githubusercontent.com/yaa110/nomino/${pkgver}/LICENSE-APACHE"
)
sha256sums=('379f00523b5b477aade598e54de1dc7efe00bd4735445f2a1a32b286a6a28996'
            'c61849f2f67590dc6e6a865e273accfd56a337ae29bc30c93ecaf50bc7bab77f'
            '0beb66d48e2a5702f0f1d8c8f62cce5877410c85eed400952db3d58a759935ef')
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}" "${pkgdir}/usr/bin/${pkgname%-bin}"
	install -Dm644 "${srcdir}/LICENSE-MIT-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
	install -Dm644 "${srcdir}/LICENSE-APACHE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}