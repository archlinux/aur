# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=AlpinDale
_pkgname=ssh-dashboard
pkgname=${_pkgname}-bin
pkgdesc="Monitor GPU/CPU Usage on SSH servers, with NVIDIA and AMD"

pkgver=0.1.0
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
sha256sums=('cbe91afb309c880b3c3bb9013fa2d75e19a1816ee05dd01cda10012be19223a1'
            '562ddc22d91b96be9f67019b365a7f1e705a305c1749660f92b5502d75f72c2b')
sha256sums_x86_64=('5464953b27c57b3ee9f23ab608bb3310876310a9d1608b6abe89378118c69ddd')
sha256sums_aarch64=('56f9fa011c19deeb528bdf73bc5df836c68998e6f193157c585316826b20afb4')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
