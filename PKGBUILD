# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Asuka Minato <asukaminato at nyan dot eu dot org>
pkgname=vtm-bin
pkgver=0.9.88
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
sha256sums_aarch64=('874e22c747bc4ee20ca88bc49a91972ab2c7b26773fdd0ac7a2ca12635be20f4')
sha256sums_armv7h=('3a8ebb6c92d45c142cd2c87e9559eddb4b367566698595b85d25768e7796ab9a')
sha256sums_i686=('141b9c370e5efa014287140f1bc1ab07c2a15d00759bb75743892652dc7bdc57')
sha256sums_x86_64=('ba7b06dbf924139529ac5464b781dd423c857e44852d27abb2e7ae0ce4b84a3f')
build() {
	bsdtar -xf "${srcdir}/${pkgname%-bin}"*.tar
}
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}