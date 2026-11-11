# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=sahilm
_gitname=yamldiff
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A CLI tool to diff two YAML files"

pkgver=1.3
pkgrel=1
_gitversion=${pkgver}

arch=('x86_64')
_barch=('linux-amd64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_gitname}-v${_gitversion}-${_barch[0]}")
sha256sums=('59b2efc903be240f40248b408918a1dbc128656dbc8264970770999078063b74'
            '1947b61fdc7520bedc826665bd0f29ccb42096962e9c44fd4b9472d469da3d0f')
sha256sums_x86_64=('a3ce774c262a12165bec37dd8e7ba2db8f02b95f97a734c63df69cd853eb3ce6')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
