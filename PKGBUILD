# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=AlpinDale
_pkgname=ssh-dashboard
pkgname=${_pkgname}-bin
pkgdesc="Monitor GPU/CPU Usage on SSH servers, with NVIDIA and AMD"

pkgver=0.1.2
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
sha256sums=('0befbe62af19711371db1afb1ee338606a437d2147ee36b2f012269c3babd53f'
            '562ddc22d91b96be9f67019b365a7f1e705a305c1749660f92b5502d75f72c2b')
sha256sums_x86_64=('5c6441efa9ec5483e8718e054e1c8d6f1783461b8cea13479d0402ed694be89b')
sha256sums_aarch64=('f0e8eb490e6b894daa741e67e8a6fb4148db063a9a5f42249c26e09e75fb7c48')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
