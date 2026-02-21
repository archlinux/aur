# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=roniel-rhack
_pkgname=rondo
pkgname=${_pkgname}-bin
pkgdesc="A modern terminal productivity app that combines task management with a daily journal"

pkgver=0.2.0
pkgrel=1
_pkgvername=v${pkgver}

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
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[0]}.tar.gz")
sha256sums=('1654036be573fb23122c21f88006be1458b6f6c0a59ccab4501fc10af0a104cc'
            'c19f5d8b29f4b59ceb763c4f66fb64730e553cfc8f0ee8b7de457c5e4946c945')
sha256sums_x86_64=('30230bf44cd72be50d5554adadb580cf28f57eeb9bce0421ea0ec2cfd901eff0')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
