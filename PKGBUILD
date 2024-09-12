# Maintainer: Ayoub Eddaoudi <me@ayoubedd.me>
# Maintainer: Rafael Baboni Dominiquini <rafaeldominiquini@gmail.com>

pkgname=zfind-bin
_pkgname="${pkgname%-bin}"
pkgver=0.4.5
pkgrel=2
pkgdesc="Search for files (even inside tar/zip/7z/rar) using a SQL-WHERE filter"
arch=('x86_64' 'arm64' 'riscv64')
url="https://github.com/laktak/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/laktak/${_pkgname}/v${pkgver}"
license=('MIT')
provides=("${_pkgname}")
conflicts=(
	"${_pkgname}"
	"${_pkgname}-git"
)
source=("LICENSE_${pkgver}::${_urlraw}/LICENSE"
		"README_${pkgver}::${_urlraw}/README.md")
source_x86_64=("${_pkgname}_${pkgver}_x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64.tar.gz")
source_arm64=("${_pkgname}_${pkgver}_arm64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64.tar.gz")
source_riscv64=("${_pkgname}_${pkgver}_riscv64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-linux-riscv64.tar.gz")
sha256sums=('f7ebb783a3ebbfd8d9871f0e1b69729c153e66c0d61a715ce58675021cffa748'
            '62d64841a060b3d05e3f57a2af067ef726bb801a5773dceea366d102ed74dfa9')
sha256sums_x86_64=('9c92e2618a60322836325f6f6f05efc526ff38ccc7a317d52576b3403776a21f')
sha256sums_arm64=('d801d36b3941646f0030cfa5948ca3d61bdbd1e168b61d5c8580ff20405cd2a7')
sha256sums_riscv64=('cfdc07524536a3ac9061fda133bda51ae119f82ae41159578140e6ee16422920')

package() {
	install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "${srcdir}/LICENSE_${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "${srcdir}/README_${pkgver}" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
