# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Asuka Minato <asukaminato at nyan dot eu dot org>
pkgname=vtm-bin
pkgver=0.9.99.71
pkgrel=1
pkgdesc="A text-based desktop environment that runs console applications in floating windows and allows remote access over tunnelling protocols such as SSH.(Prebuilt version)"
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
	#"${pkgname%-bin}-${pkgver}.xml::https://raw.githubusercontent.com/directvt/vtm/v${pkgver}/src/vtm.xml"
	"LICENSE-${pkgver}::https://raw.githubusercontent.com/directvt/vtm/v${pkgver}/LICENSE"
)
backup=("etc/${pkgname%-bin}/settings.xml")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}_linux_arm64.zip")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}_linux_arm32.zip")
source_i686=("${pkgname%-bin}-${pkgver}-i686.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}_linux_x86.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}_linux_x86_64.zip")
sha256sums=('b7d69c3a45e98eb80ff9cd48d00334d72002d9d0f96b523f8feb33263af22e12')
sha256sums_aarch64=('122d93f1fd64110971571efdedd6bc77e25fb1ca3c9935c24e5beb75974c6752')
sha256sums_armv7h=('047c2451da631bbe6e2f50abf5c79ef3ead42b619dbb266c4b3e3506fe333ca8')
sha256sums_i686=('2ac7684744540a4d24bf656bae92e2d5bc1f8e6817f42b2fc818b59d470ab1c2')
sha256sums_x86_64=('dc0cb76409cf3ca94e06162fbf2d6eccf204bae2fdbbe57d9b14bb891f3ce8e2')
prepare() {
	bsdtar -xf "${srcdir}/${pkgname%-bin}"*.tar
}
package() {
	#install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.xml" "${pkgdir}/etc/${pkgname%-bin}/settings.xml"
	install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
