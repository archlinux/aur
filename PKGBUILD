# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=timhartmann7
_gitname=omnyssh
_appname=omny
pkgname=${_gitname}-bin
pkgdesc="TUI SSH dashboard & server manager — manage all your servers from a single terminal window"

pkgver=1.0.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('x86_64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Apache-2.0')

provides=("${_appname}")
conflicts=("${_gitname}")
depends=('glibc' 'libgcc')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
sha256sums=('62cbef2f7df5217f333839853a23b814158983564b09b6365c17344deb584908'
            'c0004499a5a1e5b50c2953271bd448da1f707e34502e2f3298f5b9ff70d548ca')
sha256sums_x86_64=('8a898d3620e8bdd7ab1cc8637b1a24f1b27135e9ae62e54145c7eea5f3e1b8f9')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
