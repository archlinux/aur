# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=mihaigalos
_pkgname=aim
pkgname=${_pkgname}-bin
pkgdesc="A command line download/upload tool with resume"

pkgver=1.8.7
pkgrel=2
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
sha256sums_x86_64=('28938e9bc8b1aeb3fcdd4eb20584306240aee62a3c4996bdc53b55f8ecac8b3a')
sha256sums_i686=('481c473f665f59ad77a8e58b5e5e2b98f7df01c57f8ca89c1a07bf13d87b12ec')
sha256sums_aarch64=('fb4b4e51ff218326104f77e7307ef6e9ab8234f4fc86beff5893322c141a6aa7')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENCE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
