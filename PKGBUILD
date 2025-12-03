# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=mihaigalos
_pkgname=musage
pkgname=${_pkgname}-bin
pkgdesc="A command line memory usage information tool"

pkgver=0.1.6
pkgrel=1
_pkgvername=${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')
_str_arch="unknown-linux-gnu"

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('gcc-libs' 'glibc')

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${pkgver}-${_barch[0]}-${_str_arch}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${pkgver}-${_barch[1]}-${_str_arch}.tar.gz")
sha256sums_x86_64=('8b54b6320592f8c8107d60a658059af77ac0f01c90d16816ed2acb20f36b4cf1')
sha256sums_aarch64=('a26dba2bfebc411170c9e6345e43f1650d0cb064ed538bf340d1ab2a6ae964f5')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENCE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
