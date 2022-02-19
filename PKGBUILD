# Maintainer: Lena Fuhrimann

pkgname=nancy-bin
_pkgname="${pkgname%-bin}"
pkgver=1.0.30
pkgrel=1
pkgdesc='A tool to check for vulnerabilities in your Golang dependencies'
arch=(x86_64 i686)
url="https://github.com/sonatype-nexus-community/${_pkgname}"
license=(Apache)
provides=("${_pkgname}")
_src="${url}/releases/download/v${pkgver}/${_pkgname}"
source_x86_64=("${_src}-v${pkgver}-linux-amd64.tar.gz")
source_i686=("${_src}-v${pkgver}-linux-386.tar.gz")
sha256sums_x86_64=('30aa2af3ddc517d736feb6d0cc09c790459b0729375fe62f31cce75f57fbf38c')
sha256sums_i686=('98d76cf8d7d222bf7b489781bfff3b6750ee06b1964f3d77a36bd7c214aa5453')

package() {
	local x86_64=amd64 i686=386

	# Bin
	rm -f "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	# License
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
