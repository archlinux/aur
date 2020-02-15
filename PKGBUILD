# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='prm'
pkgver=v3.2.0
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
sha256sums_x86_64=('4bf75218a1f68e65323f2f8d5802a727137caa97503aaa1ae086dba68491b927')

source_i686=("${_basedownloadurl}/${_basearchive}_386.tar.gz")
sha256sums_i686=('aca2baad828d3d309e6c888a327759a8e2a7a9f9e7d7140dd2f05ab4c6a59ae2')

source_armv7h=("${_basedownloadurl}/${_basearchive}_armv7.tar.gz")
sha256sums_armv7h=('7840319159fb551a0a4005ced88c10a35fa376566ff8175d17bae02833899dd0')

source_aarch64=("${_basedownloadurl}/${_basearchive}_arm64.tar.gz")
sha256sums_aarch64=('49f3c6a1709e74259d783626bf15c01b241db9b75c0e557fa8992e19d3147297')

package() {
	# Bin
	rm -f "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	# License
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
