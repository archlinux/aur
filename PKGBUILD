# Maintainer: Ranadeep B < mail at rnbguy dot at >
# Contributor: Ranadeep B < mail at rnbguy dot at >

_pkgname=cairo-profiler
pkgname=${_pkgname}-bin
_orgname=software-mansion
_github=${_orgname}/${_pkgname}
pkgver=0.14.0
pkgrel=1
pkgdesc='Profiler for Cairo programming language & Starknet'
arch=('x86_64' 'aarch64')
url="https://github.com/${_github}"
license=('MIT')
provides=(${_pkgname})
conflicts=(${_pkgname})
source_x86_64=("https://github.com/${_github}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/${_github}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('4ee1d3e1821713bc82371eadc14044e7090527f8abb09d047258c85d7bc5b835')
sha256sums_aarch64=('c01fc4ed88e5e358068968cc3cb82fa6254e05dd7faed79ae077b20d88602e81')

package() {
	for each_executable in $(ls "${srcdir}/${_pkgname}-v${pkgver}-${CARCH}-unknown-linux-gnu/bin/"); do
		install -Dm755 "${srcdir}/${_pkgname}-v${pkgver}-${CARCH}-unknown-linux-gnu/bin/${each_executable}" "${pkgdir}/usr/bin/${each_executable}"
	done
}
