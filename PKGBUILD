# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=AlpinDale
_pkgname=ssh-dashboard
pkgname=${_pkgname}-bin
pkgdesc="Monitor GPU/CPU Usage on SSH servers, with NVIDIA and AMD"

pkgver=0.0.9
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-${pkgver}-${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-${pkgver}-${_barch[1]}")
sha256sums=('33140be53d94964100a12fffc21c0fd704b20069a4b4005fbfd7ca7cbe9193f5'
            '562ddc22d91b96be9f67019b365a7f1e705a305c1749660f92b5502d75f72c2b')
sha256sums_x86_64=('062a626007363c8b9a2e4935cb04be05eef4ad36224adcbceb191757e26f0c7b')
sha256sums_aarch64=('b1f28f5e1e81504182b0e828720732d5e57c1914c52c5186946938aabcffe047')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
