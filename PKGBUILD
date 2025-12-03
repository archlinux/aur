# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=mihaigalos
_pkgname=pipeview
pkgname=${_pkgname}-bin
pkgdesc="A command line pipe inspection utility"

pkgver=0.3.3
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
depends=('gcc-libs' 'glibc')

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${pkgver}-${_barch[0]}-${_str_arch}.tar.gz")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${pkgver}-${_barch[1]}-${_str_arch}.tar.gz")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${pkgver}-${_barch[2]}-${_str_arch}.tar.gz")
sha256sums_x86_64=('e7629ac63512b735c0c734d4d7babd3c73c741ac95f6c09d4e767c586314efae')
sha256sums_i686=('b377d7f2483616c2f8625048641af7bc3ee40930e7045ef2204a4b6509d35e75')
sha256sums_aarch64=('6431963a4cf95fa3616309ab84a4591dbb7b9a972113fcac7a35bc4276c06ab2')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENCE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
