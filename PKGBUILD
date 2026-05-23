# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=MertJSX
_pkgname=folderhost

pkgname=${_pkgname}-bin
pkgdesc="Your own private cloud in one executable. Share files, collaborate on code, and manage users without complex setup"

pkgver=26.5.1
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}.tar.gz")
sha256sums=('b3c521ca240eef60c6de45d07363225550a46e627daf59bc6c6d4698a8375cf6'
            'ae51ec43f7a847669150ee6ed196f4438614a3adce4cd267cc5170c21655d5ab')
sha256sums_x86_64=('ae29f44946034beb51ccd5ba0b0054d1af51df6aad62f585a2d34461e2d5da1b')
sha256sums_aarch64=('2fbcd3a6b3644100f1b602af346a425c82960556ad5bdd12c80f0d6f20528904')

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
