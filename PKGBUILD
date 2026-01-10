# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=mihaigalos
_pkgname=aim
pkgname=${_pkgname}-bin
pkgdesc="A command line download/upload tool with resume"

pkgver=1.8.7
pkgrel=3
_pkgvername=${pkgver}

arch=('x86_64' 'i686' 'aarch64')
_barch=('x86_64' 'i686' 'aarch64')
_str_arch="unknown-linux-gnu"

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('gcc-libs' 'glibc' 'zlib')

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${pkgver}-${_barch[0]}-${_str_arch}.tar.gz")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${pkgver}-${_barch[1]}-${_str_arch}.tar.gz")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${pkgver}-${_barch[2]}-${_str_arch}.tar.gz")
sha256sums_x86_64=('4f528d200eff45d37054d93324f3633b7813febbf39997e440cfdd246888f567')
sha256sums_i686=('54739486177cbef4ad98ed0f10f1c820c322c16b7b3d527f6b4a0c1080f40767')
sha256sums_aarch64=('40b4f2bcd6f4fbf98be72f6ee594185753a6fa468e862c27c8c050ce6d4e9057')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENCE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
