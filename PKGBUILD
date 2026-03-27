# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=hymkor
_pkgname=seek
pkgname=${_pkgname}-bin
pkgdesc="Color-Grep for ANSI/UTF8"

pkgver=0.2.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'i686')
_barch=('linux-amd64' 'linux-386')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('BSD-3-Clause')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/readme.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.zip::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[0]}.zip")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}.zip::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[1]}.zip")
sha256sums=('06bed19d0d6b2cbc75b88eab7443c8c6bc1a6e653598a16697d18732eacecdc6'
            'ae3f6dfc57269e5b9d206c4f1a63494042d75ab42beb37ebbcdc3ce53e687b1a')
sha256sums_x86_64=('81dedee344ae3625b6ade28559a667bcbbc37069481ad7362567aa5d36205b01')
sha256sums_i686=('7feb4e4eefbf9d788bb85cc7f7f034065ac064fcf1753b03c40b0e56a84e6cbf')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
