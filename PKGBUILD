# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=opmr0
_gitname=zeitx
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A terminal countdown timer and stopwatch with big ASCII-art digits"

pkgver=0.1.0
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
sha256sums=('a9db65d399bbc8550c0a585c448ff3a067f1ce178443b761f90e328d2c5124d1'
            '13652efbec3141f3283d21d82d8d4e335fbe49316b26703e7ac149cae7c78682')
sha256sums_x86_64=('848b074a2785ecb4ae058c07f1017b72573f93d54454675f98c895bdf4d7f8d5')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
