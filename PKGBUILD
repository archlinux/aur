# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Asuka Minato <asukaminato at nyan dot eu dot org>
pkgname=vtm-bin
pkgver=0.9.95
pkgrel=1
pkgdesc="A text-based desktop environment that runs console applications in floating windows and allows remote access over tunnelling protocols such as SSH."
arch=(
	'aarch64'
	'armv7h'
	'i686'
	'x86_64'
)
url="https://github.com/directvt/vtm"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source=(
	"LICENSE-${pkgver}::https://raw.githubusercontent.com/directvt/vtm/v${pkgver}/LICENSE"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}_linux_arm64.zip")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}_linux_arm32.zip")
source_i686=("${pkgname%-bin}-${pkgver}-i686.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}_linux_x86.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}_linux_x86_64.zip")
sha256sums=('7b7086edfedec1a2d8b40bc3748c2b77688806b4ab1081c3570fd7bb9b2c7842')
sha256sums_aarch64=('d1c6c0f2d69e337cbd7ec1c8d344b5142a91aa2adf5326b08f8f0752611e2162')
sha256sums_armv7h=('a8ff5e4e1e93978c7b348daf45a23f8a65128fd834aaa6aa47b10c6d830bf8ec')
sha256sums_i686=('306d4ed2bb3948da8bf52573dcbdb7aef5439305f94149c27ea107d37a9256f2')
sha256sums_x86_64=('004ee25eb28b84be428e63063d112da6cddcdb003e18f75150d643a8470a3fde')
build() {
	bsdtar -xf "${srcdir}/${pkgname%-bin}"*.tar
}
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}