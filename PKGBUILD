# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=preiter93
_gitname=tuigram
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A TUI sequence diagram editor"

pkgver=0.1.6
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Unlincense')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[1]}.tar.gz")
sha256sums=('29b61d9fd7248d4b1cf0f55a940675bddd4550d6b40cac5679b47ab24853f6e5')
sha256sums_x86_64=('f64132e0ede623a642e044ec2b8052b87f7a86ed4bf181d7e22d4193d7e2aed9')
sha256sums_aarch64=('3574f5dec702af01d3441f8d4b71a3c1fac5a9de06c6e9ec458ce1a722d57911')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
