# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=Ataraxy-Labs
_gitname=lazydiff
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A fast terminal UI for reviewing Git diffs"

pkgver=0.1.0
pkgrel=17
_gitversion=v${pkgver}-alpha.${pkgrel}

arch=('x86_64')
_barch=('linux-x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc' 'openssl' 'zlib')

options=(!strip)

source=("README-${pkgver}-${pkgrel}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}-${pkgrel}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}-${pkgrel}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
sha256sums=('fd1a82ee706a33cbf7d8e5c8090d6eeb87857634994c4f6971145bca936d05fe'
            'ac1c162eee0bc8161b18d934bb406dae9d7624a261fbb7bf58d4aeb7ea1736b8')
sha256sums_x86_64=('5325731ef96f00d6ab2967e8560b52f7013ad05c00f0e7841f43a115f3f0f2b1')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}-${pkgrel}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}-${pkgrel}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
