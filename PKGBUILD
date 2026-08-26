# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=dkorunic
_gitname=pktstat-bpf
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="eBPF-based Ethernet traffic monitor using TC, XDP, kprobes and cgroups"

pkgver=0.17.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('Linux_x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

install="${_appname}.install"

options=(!strip)

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[0]}.tar.gz")
sha256sums_x86_64=('be84c6c2a01b240a9dc97c2e054f5b8498e8d67149de36d3533863b285b4d21c')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
