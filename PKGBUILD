# Maintainer: Lena Fuhrimann

pkgname=moq-bin
_pkgname="${pkgname%-bin}"
pkgver=0.2.7
pkgrel=1
pkgdesc='Interface mocking tool for go generate'
arch=(x86_64)
url="https://github.com/matryer/${_pkgname}"
license=(MIT)
provides=("${_pkgname}")
_src="${url}/releases/download/v${pkgver}/${_pkgname}"
source_x86_64=("${_src}_${pkgver}_Linux_x86_64.tar.gz")
sha256sums_x86_64=('62e5223300d7727744c7abefcabb11750bb53355be2ba73480a84a58788bd949')

package() {
	local x86_64=amd64

	# Bin
	rm -f "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	# License
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
