# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=MertJSX
_pkgname=folderhost
pkgname=${_pkgname}-bin
pkgver=26.4.0
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="Your own private cloud in one executable. Share files, collaborate on code, and manage users without complex setup"
arch=('x86_64')
_barch=('amd64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.zip::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[0]}.zip")
sha256sums=('b3c521ca240eef60c6de45d07363225550a46e627daf59bc6c6d4698a8375cf6'
            'd8153c36cc947a0f02abce527715f44ec3b7732f6a0ae7450d1a94034c09301c')
sha256sums_x86_64=('7450fc3c31ed2a9f683d30e12d532a329b53d7a0f5bc3a0c338d8c9143a42aa4')

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
