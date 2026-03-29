# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=altlimit
_pkgname=sitegen
pkgname=${_pkgname}-bin
pkgdesc="Sitegen is a simple but flexible static site generator."

pkgver=1.0.35
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE.txt")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}_${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}_${_barch[1]}")
sha256sums=('662d6dfea4b6d6b94c82ce29bdb937f8f149f214e7f04e61626f47263b9c9165'
            '1d9ea865074fbbf9c4fd61ee0b36ad684b69f8ed7c2d083464484ada5cac243c')
sha256sums_x86_64=('69101e0b4d2da721436d5057ac70671a9574f02aa422eab3725379458c645255')
sha256sums_aarch64=('c98e3ad043316fe608679594023e038c13efb4e284e37adb726aac6905337230')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
