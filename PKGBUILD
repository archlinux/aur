# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=petereon
_pkgname=sherut
pkgname=${_pkgname}-bin
pkgdesc="A lightweight tool that exposes shell commands as HTTP endpoints"

pkgver=0.1.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')
_barch=('linux-amd64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'libgcc')

source=("README-${pkgver}.md::${_urlraw}/README.md"
        "LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}.tar.gz")
sha256sums=('5d7ac2cd83ac2e18486b474da1eee5a95da3b5dd2eca53d524333e24a5039cb4'
            '3b2920eba054c62cc3b33a046d5a2c8a13c56a83dbcda772ae2f6e665b4b737f')
sha256sums_x86_64=('ac998b2340b33bca62be65c3cbb79ffc0265ed378cad5ce100ce64322d8e15b0')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
