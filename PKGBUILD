# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=reekta92
_gitname=graf
_appname=${_gitname}
pkgname=${_gitname}-rs-bin
pkgdesc="Terminal-based force-directed graph visualizer for markdown wikilinks"

pkgver=0.4.16
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
optdepends=("clin")

options=(!strip)

source=("LICENSE-${pkgver}::${_ghurlraw}/LICENSE"
        "README-${pkgver}.md::${_ghurlraw}/README.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-rs-${pkgver}-${_barch[0]}.tar.gz")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '26a5f10047204671ede536d81504fe90994880dfc6586962e912650b1881cc3e')
sha256sums_x86_64=('7454a01b10329cee65e702d4adc0a2c5a5812f34098b5a9e7bcce4798ef523cf')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_gitname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
