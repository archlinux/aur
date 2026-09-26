# Maintainer: CosmicHeron <dev cosmicheron com>

_bin='ziso'
_pkgbase="${_bin}_compressor_rust"
pkgname="${_pkgbase}-bin"
pkgdesc='A rust written ziso compressor with multipple threads support'
url='https://github.com/Danixu/ziso_compressor_rust'
license=('Apache-2.0')
pkgver='1.0.1'
pkgrel='2'
arch=('x86_64')
provides=("$_bin")
conflict=("$_bin")
depends=('glibc' 'libgcc')
_src="${pkgname}-${pkgver}"
_license="LICENSE-${pkgver}"
source=(
	"${_src}.zip::${url}/releases/download/v${pkgver}/ziso-linux-x64-glibc.zip"
	"${_license}::https://raw.githubusercontent.com/Danixu/ziso_compressor_rust/refs/tags/v${pkgver}/LICENSE"
)
b2sums=(
	'378d1571b04be56fc27caff1e96e8a9c61215444ec1db11df97880699659a431e5daeaf7106ec74257880d99924fc76cbe58086d2e0c820d398cabda028cbbdb'
	'7e49a6bd1b1d8756ff8516fa4c7ec9503cfc2955ae12f53ded3332e82e5b2cef1bae036578a020f493ab642029424938cc6a5435cb2ee07c5d3c717e396e40ef'
)

package() {
	cd "${srcdir}" || exit
	install -Dm755 "${_bin}" "${pkgdir}/usr/bin/${_bin}"
	install -Dm644 "${_license}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
