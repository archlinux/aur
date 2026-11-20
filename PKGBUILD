# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=altlimit
_pkgname=sitegen
pkgname=${_pkgname}-bin
pkgdesc="Sitegen is a simple but flexible static site generator."

pkgver=1.0.41
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
sha256sums=('0d786ea5a929ec26052801bf635bd1d6ad171e4b0d46ae9e6c1cb9096d519a57'
            '1d9ea865074fbbf9c4fd61ee0b36ad684b69f8ed7c2d083464484ada5cac243c')
sha256sums_x86_64=('cf5b9bc626a189f0a6f784ad576fd4ecf2122243f37708e6e03a26301e51367e')
sha256sums_aarch64=('1b84deaf311b786a18046713da08f06e7bbe248d231d4c3057016b0faa74e750')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
