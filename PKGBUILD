# Maintainer: Ranadeep B < mail at rnbguy dot at >
# Contributor: Ranadeep B < mail at rnbguy dot at >

_pkgname=scarb
pkgname=${_pkgname}-bin
_orgname=software-mansion
_github=${_orgname}/${_pkgname}
pkgver=2.19.4
pkgrel=1
pkgdesc='The Cairo package manager'
arch=('x86_64' 'aarch64')
url='https://docs.swmansion.com/scarb'
license=('MIT')
provides=(${_pkgname})
conflicts=(${_pkgname})
source_x86_64=("https://github.com/${_github}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/${_github}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('3832b9d79640e5385372025be53b5a7dbdbee5ca1b2c7ab5d5c21e090dc9e108')
sha256sums_aarch64=('d5267b6c5addbc7ad22765a1341cb3fbee8d59db2232d8fc63468f14e1ec79f5')

package() {
	for each_executable in $(ls "${srcdir}/${_pkgname}-v${pkgver}-${CARCH}-unknown-linux-gnu/bin/"); do
		install -Dm755 "${srcdir}/${_pkgname}-v${pkgver}-${CARCH}-unknown-linux-gnu/bin/${each_executable}" "${pkgdir}/usr/bin/${each_executable}"
	done
	install -Dm644 "${srcdir}/${_pkgname}-v${pkgver}-${CARCH}-unknown-linux-gnu/doc/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
