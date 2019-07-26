# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='prm'
pkgver=v2.6.1
pkgrel=1
pkgdesc='Pull Request Manager for Maintainers'
url='https://ldez.github.io/prm/'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('APACHE')

provides=("${pkgname}")
conflicts=("${pkgname}" "${pkgname}-git")

depends=('git')
makedepends=()

_repourl='https://github.com/ldez/prm'
_basedownloadurl="${_repourl}/releases/download/${pkgver}"
_basearchive="${pkgname}_${pkgver}_linux"

source_x86_64=("${_basedownloadurl}/${_basearchive}_amd64.tar.gz")
sha256sums_x86_64=('daadf04b5609e3a64e2815c0116bcfe9bf16ce9e0c616444f19e5bb783f41aff')

source_i686=("${_basedownloadurl}/${_basearchive}_386.tar.gz")
sha256sums_i686=('50f7bce5c4921320b321a8971063e6f3fe164d56df2210be300260d52f14a681')

source_armv7h=("${_basedownloadurl}/${_basearchive}_armv7.tar.gz")
sha256sums_armv7h=('d4854a8ddc3d9dcfb00240a6e356ad226d47d93f107a3b92a74108e145fa9d53')

source_aarch64=("${_basedownloadurl}/${_basearchive}_arm64.tar.gz")
sha256sums_aarch64=('ff298d636a261971f9603e89e16318fdf9073254d8465a2c70caecab9dbbf24e')

package() {
	# Bin
	rm -f "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	# License
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
