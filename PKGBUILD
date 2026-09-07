# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Ben Boyter <ben@boyter.org>

_pkgauthor=boyter
_pkgname=scc
pkgname=${_pkgname}-bin
pkgdesc="Sloc, Cloc and Code: scc is a very fast accurate code counter with complexity calculations and COCOMO estimates written in pure Go"

pkgver=4.1.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'i686' 'aarch64')
_barch=('Linux_x86_64' 'Linux_i386' 'Linux_arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${_barch[0]}.tar.gz")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${_barch[1]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${_barch[2]}.tar.gz")
sha256sums_x86_64=('c7328436d3027f4357d3d7853f7dc3ac2bbcb4ca08f1adad91a27c593884079b')
sha256sums_i686=('cddeda90ec848c614c6c390eae8b638f94d88e9450e00bf2ba5f420f83b66de1')
sha256sums_aarch64=('6e0d2a1f8d3540ba7df185477dec40bb7340f1b214bfd303147de5cad2bd7b8b')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
