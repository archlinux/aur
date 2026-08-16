# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=aryankahar31
_gitname=runx
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Universal project launcher with portable runtimes. Run projects without installing Node, Python, or other toolchains globally."

pkgver=0.5.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux-x64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md" "LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
sha256sums=('a4231db64361a6f7c240e2288a8deba584cc77a20d7458089484dca083d3f5ff'
            'fbd9c09c7b576e977fa12ea54df5861ae6ae9b130487f1e1664550f743257f31')
sha256sums_x86_64=('2e3bf90e54842dc748a7b26c7ff8d600b75fb74eadf308114f1e25351be6f95e')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
