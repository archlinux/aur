# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=reekta92
_gitname=pinstar
_appname=${_gitname}
pkgname=${_gitname}-bin
pkgdesc="Canvas file editor compatible with Obsidian .canvas files"

pkgver=0.5.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('GPL-3.0')

provides=("${_appname}")
conflicts=("${pkgname%%-bin}")

depends=('glibc' 'libgcc')
optdepends=("graf")

options=(!strip)

source=("LICENSE-${pkgver}::${_ghurlraw}/LICENSE"
        "README-${pkgver}.md::${_ghurlraw}/README.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${pkgver}-${_barch[0]}.tar.gz")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '7b7c751b24eec9cd9b51ab5c975a859e094828ae3d92b2e792612818d39f0097')
sha256sums_x86_64=('c9b6cea9dba0c2ccf4e83ca32096634d1ec625576893ca096b00900c8313c9e4')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_gitname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
