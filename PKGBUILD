# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Adembc
_pkgname=lazyssh
pkgname=${_pkgname}-bin
pkgver=0.2.1
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="A terminal-based SSH manager inspired by lazydocker and k9s"
arch=('x86_64' 'i686' 'aarch64')
_barch=('x86_64' 'i386' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}_Linux_${_barch[0]}.tar.gz")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}_Linux_${_barch[1]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}_Linux_${_barch[2]}.tar.gz")
sha256sums_x86_64=('6d94d288c6c18985f988db035fc0da66f306c291801a2f9a8ea7e28cab8bb60f')
sha256sums_i686=('32af8f3682145bd2c77e6c53120ccf2a1e4435731587e569a5c522377f532fb4')
sha256sums_aarch64=('a5e6a0e2b698b6ae099b890cafc94c631f67b4e020ffe1ee1570d9a28fb78271')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
