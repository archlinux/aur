# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=roniel-rhack
_pkgname=rondo
pkgname=${_pkgname}-bin
pkgdesc="A modern terminal productivity app that combines task management with a daily journal"

pkgver=0.6.0
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
            'aebe97d8c285bdb8e71eb00838362d51bdb590c8289a4f94725ee50c529e2ef1')
sha256sums_x86_64=('87b2c78146e642c43b3ec57dac6f1925468b2ac57a7c116c1afb261c5449d70d')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
