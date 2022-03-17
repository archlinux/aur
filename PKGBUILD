# Maintainer: Lena Fuhrimann

pkgname=nancy-bin
_pkgname="${pkgname%-bin}"
pkgver=1.0.32
pkgrel=1
pkgdesc='A tool to check for vulnerabilities in your Golang dependencies'
arch=(x86_64 i686)
url="https://github.com/sonatype-nexus-community/${_pkgname}"
license=(Apache)
provides=("${_pkgname}")
_src="${url}/releases/download/v${pkgver}/${_pkgname}"
source_x86_64=("${_src}-v${pkgver}-linux-amd64.tar.gz")
source_i686=("${_src}-v${pkgver}-linux-386.tar.gz")
sha256sums_x86_64=('8413b649d0ff5eefbffd097f19a7115105a4373275479087c21ba1d87a0bc876')
sha256sums_i686=('8a22e50b7d009b4e08de1d756a55d0b75d4b9b07dd2eadf03d9151d96d4d92c3')

package() {
	local x86_64=amd64 i686=386

	# Bin
	rm -f "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	# License
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
