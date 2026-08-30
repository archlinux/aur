# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=opmr0
_gitname=zeitx
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A terminal countdown timer and stopwatch with big ASCII-art digits"

pkgver=0.1.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux-x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}")
sha256sums=('94aa1ae847282eb9f6c24bb4758d2b77b5e66a694c7defe9a9f825689c076b9f'
            '13652efbec3141f3283d21d82d8d4e335fbe49316b26703e7ac149cae7c78682')
sha256sums_x86_64=('39fc24dac076b8c0868b97b8e889e385017e450092b44a181e22e981875b467c')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
