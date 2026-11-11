# Maintainer: NECOdes <henlo at necodes dot tf>

pkgname=zigfetch-bin
_pkgname=${pkgname%-bin}
pkgver=0.32.0
pkgrel=2
pkgdesc='Zigfetch is a minimal neofetch/fastfetch like system information tool.'
arch=('x86_64')
url='https://github.com/utox39/zigfetch'
_ghurlraw="https://raw.githubusercontent.com/utox39/zigfetch/v${pkgver}"
license=('MIT')

provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!debug')
depends=('pciutils')

source=(
	"${url}/releases/download/v${pkgver}/zigfetch-${arch}-linux.zip"
	"LICENSE-${pkgver}::${_ghurlraw}/LICENSE"
	"README-${pkgver}.md::${_ghurlraw}/README.md"
	"${_ghurlraw}/config.json"
)
sha256sums=('a6c008a2cbde197efaf512317e2c43170eae45b134f6fc10044630448ec8c9ea'
            'bb0cdfa1f9f726f12d3704bfc930c1b8a2c06c0382da34181921429a59dec8d9'
            'd17db83e680755b8c200186c55d2bd37c9cdd6ca5ec25fd9aa62b905deec1ca2'
            '38f97c39b209e9f41b3fb3646ecba2acbeae4446bd3d56fc46d198dcf407d09f')

package() {
	cd "${srcdir}"

	install -Dm755 "${_pkgname}-${arch}-linux" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 config.json "${pkgdir}/usr/share/doc/${pkgname}/examples/config.json"
}
