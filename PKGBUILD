# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=knqyf263
_pkgname=sou
pkgname=${_pkgname}-bin
pkgver=0.2.0
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="A tool for exploring files in container image layers"
arch=('x86_64' 'aarch64')
_barch=('x86_64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('Apache-2.0')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_Linux_${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_Linux_${_barch[1]}.tar.gz")
sha256sums_x86_64=('a60a5c0ada9c6cbf9219ecc065f8b8c56cb64bdf91b468bcda638954e44d33c7')
sha256sums_aarch64=('1af4e102a2fa9375e35499997cf84c5f33f61ab43be17c0039908b4af247b9de')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
