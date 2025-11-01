# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=reemus-dev
_pkgname=gitnr
pkgname=${_pkgname}-bin
pkgver=0.2.2
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="A CLI to generate .gitignore files using one or more templates"
arch=('x86_64')
_barch=('amd64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs' 'openssl')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/readme.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[0]}")
sha256sums=('b16ae045901cd75e09f19fec662522a279218eed8c70e6fac85789f3d76bea9d'
            'bcb654f04818b302ba2dda32b43f91c67ea663ada62b229bf346bf3c675fdc13')
sha256sums_x86_64=('fe185c57965ec6d6be9e63ab434edfeac5091ce57ebd366ba35844f33da06fbb')



package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
