# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=reekta92
_gitname=pinstar
_appname=${_gitname}
pkgname=${_gitname}-bin
pkgdesc="Canvas file editor compatible with Obsidian .canvas files"

pkgver=1.0.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('GPL-3.0')

provides=("${_appname}")
conflicts=("${pkgname%%-bin}")

depends=('glibc' 'libgcc')
optdepends=("graf")

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.txz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_barch[0]}.tar.xz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.txz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}.tar.xz")
sha256sums_x86_64=('52cf1552873c58e51e01bb4f731517b38cbc7c6e27499f518208b6b714f760b9')
sha256sums_aarch64=('39b4c7a5f56d9f8f907580a029db87e80c9055c16bdc6b1d9f79111181a1429c')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_gitname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
