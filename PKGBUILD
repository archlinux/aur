# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=polblancoo
_gitname=tubetui
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="YouTube — and your own videos and music — in the terminal"

pkgver=0.8.7
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('x86_64-linux')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('AGPL-3.0')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc')

options=('!strip')

source=("LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
sha256sums=('0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0')
sha256sums_x86_64=('f355475336d7c5fb7e7caa12b3e17ae52c969cace575cb6b3013565d9d8ee770')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "${_appname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
