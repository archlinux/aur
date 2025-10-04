# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=rocajuanma
_pkgname=anvil
pkgname=${_pkgname}-bin
pkgver=1.5.1
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="Streamline tool installation and team onboarding"
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('Apache-2.0')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[1]}")
sha256sums=('cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30'
            'cdca8391e648c2ad2f973f7df6d6bd749d70a3490476b32615ddc432b3762418')
sha256sums_x86_64=('cdf0e51ed2c5dcbf495fd03bd26c67b0874047437610bcd64d97de0b07596a00')
sha256sums_aarch64=('6f5a09303ec834ff0d39932d319fee06cfaa4bcbaa008eec61283f3d6056a463')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
