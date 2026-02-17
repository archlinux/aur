# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=mihaigalos
_pkgname=aim
pkgname=${_pkgname}-bin
pkgdesc="A command line download/upload tool with resume"

pkgver=1.8.8
pkgrel=1
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
sha256sums_x86_64=('176ce87f5ec008df956738d7d1107be3bc878ef6c7c1c63387111546516d1e06')
sha256sums_i686=('3baf41bae1cb00af270968f3d8a9c13b7042949eb801c51d09d89387644eccd2')
sha256sums_aarch64=('fca1d8b5fd4f4deaef0e7bb6bc77c40c2110ee595f2db6f89835eab7b4825778')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENCE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
