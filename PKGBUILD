# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=amir20
_pkgname=dtop
pkgname=${_pkgname}-bin
pkgdesc="Terminal dashboard for Docker"

pkgver=0.11.1
_pkgvername=v${pkgver}
pkgrel=1

license=('MIT')
arch=('x86_64' 'aarch64' 'armv7h')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu' 'armv7-unknown-linux-gnueabihf')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs')

options=('!strip')

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}.tar.gz")
source_armv7h=("${_pkgname}-${arch[2]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[2]}.tar.gz")
sha256sums_x86_64=('1100c9305a0eb517c751eea3c6aeaf0cc877c6981eedc7403727f7be50e0a622')
sha256sums_aarch64=('18acd0acdf139c5fd09498224edf22682a54c2d9b7962e08746e8ebd53cec4a2')
sha256sums_armv7h=('283b99661a7c2a5c9173f67e808168e53ecd467d37ffb4b77741047f6bef71c7')


package() {
	cd "${srcdir}/${_pkgname}-${CARCH}-unknown-linux-gnu/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
