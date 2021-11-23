# Maintainer: Lena Fuhrimann

pkgname=nancy-bin
_pkgname="${pkgname%-bin}"
pkgver=1.0.29
pkgrel=3
pkgdesc='A tool to check for vulnerabilities in your Golang dependencies'
arch=(x86_64 i686)
url="https://github.com/sonatype-nexus-community/${_pkgname}"
license=(Apache)
provides=("${_pkgname}")
_src="${url}/releases/download/v${pkgver}/${_pkgname}"
source_x86_64=("${_src}-v${pkgver}-linux-amd64.tar.gz")
source_i686=("${_src}-v${pkgver}-linux-386.tar.gz")
sha256sums_x86_64=('6f8dec1437157f5c366ad3975c759689923a447293324921a990da6204afd313')
sha256sums_i686=('4b4e3c9576920cf0a32a435b401645d1fb7d06217c5d626d35a4df398e5e2267')

package() {
	local x86_64=amd64 i686=386

	# Bin
	rm -f "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	# License
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
