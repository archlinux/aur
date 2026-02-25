# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=MertJSX
_pkgname=folderhost
pkgname=${_pkgname}-bin
pkgver=26.2.1
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
            'a2db54e86be6dbbf55a2982db54b08858d7398a1132799f7f3c32243ad2332c8')
sha256sums_x86_64=('f67e419d6911080a3041b5da90ba967923ee0ce62c9a1ed7106d6bfc2c317ad2')

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
