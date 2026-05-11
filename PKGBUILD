# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=hymkor
_pkgname=sqlbless
pkgname=${_pkgname}-bin
pkgdesc="Safety-Oriented Terminal SQL Client"

pkgver=0.27.6
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'i686')
_barch=('linux-amd64' 'linux-386')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.zip::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[0]}.zip")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}.zip::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[1]}.zip")
sha256sums=('2c25ca6e12a856628da1ec430e0b6a0c2b17eb7b74939e116d7d96c2cee7e48c'
            '9dca55c36cc944452f1b780acb8c2f1be3b561ee072381fb69faeb2e76abda1b')
sha256sums_x86_64=('3c512846e167044f2bfbbe7cb250b3834f0abd045395e21fb6252f99f627bde7')
sha256sums_i686=('d95a53c2a11916d22a36e96cfd91472e7eb60dc19b819f0eda78e4770407317b')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
