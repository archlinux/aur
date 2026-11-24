# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=pitahayaDevSoft
_gitname=poshbuddy
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="TUI manager for Oh My Posh"

pkgver=0.8.1
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
depends=('glibc' 'libgcc' 'fontconfig' 'oh-my-posh')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
sha256sums=('c6a97fd32d16bacedf1bf78e45ce8a2b8601b5cad0677dd6b2d1ae457f3f8155'
            '0e0fd16681a32bca32792053882fdc99d0132a40c5c4a27492557b1b87694bba')
sha256sums_x86_64=('c3b3dc42de233139450c004e77e5b19c74196d826452a682bf9afe6d9d1eee6a')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

