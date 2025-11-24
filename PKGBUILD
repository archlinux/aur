# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=MertJSX
_pkgname=folderhost
pkgname=${_pkgname}-bin
pkgver=25.11.10
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
sha256sums=('bcca794627066c8b5b93d00043b5f8111dd7e49b95c71ba0c092eea27f5915ef'
            'cf807c7ff1324ef8e56f46f7a102d3cae59c31816c7f8bb5618ced06eacd6b3a')
sha256sums_x86_64=('4c67f2830e261a8d47134dbc6f0c23762cab6f004b519d86e1d510a8ac03bcff')

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
