# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='prm'
pkgver=v2.4.0
pkgrel=1
pkgdesc='Pull Request Manager for Maintainers'
url='https://github.com/ldez/prm'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('APACHE')

provides=("${pkgname}")
conflicts=("${pkgname}" "${pkgname}-git")

depends=('git')
makedepends=()

_source="${url}/releases/download/${pkgver}/${pkgname}_${pkgver}_linux"

source_x86_64=("${_source}_amd64.tar.gz")
sha256sums_x86_64=('043ad137dd495358e9f647597ebe7a608a3ae2d7f25771e10480771c69cd8135')

source_i686=("${_source}_386.tar.gz")
sha256sums_i686=('5b5b809b11cdd9b372514fd016674a029fcfb451af0048db247551608932398f')

source_armv7h=("${_source}_armv7.tar.gz")
sha256sums_armv7h=('42f0486f2f617363f0c3e3a8588953116a76ccec471409fe93e3431a9d3ebc0f')

source_aarch64=("${_source}_arm64.tar.gz")
sha256sums_aarch64=('fb16b3ed1a720695eb30e65178348855a862e51eb0f96b7552a62bc474a2621e')

package() {
  # Bin
	rm -f "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	# License
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
