# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=MertJSX
_pkgname=folderhost
pkgname=${_pkgname}-bin
pkgver=25.11.13
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
            '6ac3fe9dd56d53cce49e71660d3ee3c67fbd90eb9ca7f28d6983ce6171ee5a46')
sha256sums_x86_64=('b1f0fd9b231776d1cce75f4bf95919043866ce4cbc6e440cf35d0c5c2181bf07')

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
