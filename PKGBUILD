# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='gcg'
pkgver=1.7.11
pkgrel=1
pkgdesc='A GitHub Changelog Generator. '
url='https://github.com/ldez/gcg'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('APACHE')
provides=("${pkgname}")

depends=()
makedepends=()

_basedownloadurl="${url}/releases/download/v${pkgver}"
_basearchive="${pkgname}_v${pkgver}_linux"

source_x86_64=("${_basedownloadurl}/${_basearchive}_amd64.tar.gz")
sha256sums_x86_64=('7d9d29e0781b6c7b5384ce766315333de8d735acb57b8620bb01d50650bd8d04')

source_i686=("${_basedownloadurl}/${_basearchive}_386.tar.gz")
sha256sums_i686=('05f75f9938ac6184551234e3026695faa5df4cde47e8243635f0d0cff43f69f7')

source_armv7h=("${_basedownloadurl}/${_basearchive}_armv7.tar.gz")
sha256sums_armv7h=('ca80a463d459b399a9f4361196ec39edde96b7b119e44b44cc157db24c0a3d51')

source_aarch64=("${_basedownloadurl}/${_basearchive}_arm64.tar.gz")
sha256sums_aarch64=('330e99a5080049f279dd0d4507e5df851c65ed81b4d7f6f5c857126441e6a282')

package() {
	# Bin
	rm -f "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	# License
	install -Dm644 "${srcdir}/LICENCE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
