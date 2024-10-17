# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Asuka Minato <asukaminato at nyan dot eu dot org>
pkgname=vtm-bin
pkgver=0.9.99.23
pkgrel=1
pkgdesc="A text-based desktop environment that runs console applications in floating windows and allows remote access over tunnelling protocols such as SSH.Prebuilt version."
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
sha256sums=('b7d69c3a45e98eb80ff9cd48d00334d72002d9d0f96b523f8feb33263af22e12')
sha256sums_aarch64=('ff408754804154d06b8f0207bb09cd9fd934801315894357ee42e473283b537d')
sha256sums_armv7h=('7c0fe2661b53e69688172bc4a2aec4f2d8dbf5b12fc3dc3f02f62403100f59d4')
sha256sums_i686=('db6b46a1b5d5f3ec6e11eeaeab4d615bbd50b65752db7298519c0b82605fae96')
sha256sums_x86_64=('96b239a08adc827d1026fc138c73a7fb59ec46ab678fc745ced0f82e6db83f09')
build() {
	bsdtar -xf "${srcdir}/${pkgname%-bin}"*.tar
}
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
