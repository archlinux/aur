# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=islandspan-solutions
_gitname=gitr
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A compact git commit graph viewer"

pkgver=0.4.17
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux-x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc' 'zlib' 'git')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
sha256sums=('b7fcaf80ca80a9bfef3fbf6e4aa8e73a7ed03f0ab62824fdd3f70f4604e95acf'
            '1e04f95c77a24c83f64db09ff0ceec2cfe2eada73bd65bf5f205df013c79d99c')
sha256sums_x86_64=('729b2cbdb627b36c8da21861ca52ae04904bcefbf9ce768e61fc02e613d2153c')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
