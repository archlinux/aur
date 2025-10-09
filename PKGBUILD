# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=DaltonSW
_pkgname=campfire
pkgname=${_pkgname}-bin
pkgver=0.9.2
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="Cozy up with your logs"
arch=('x86_64' 'i686' 'aarch64')
_barch=('x86_64' 'i386' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}_Linux_${_barch[0]}.tar.gz")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}_Linux_${_barch[1]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}_Linux_${_barch[2]}.tar.gz")
sha256sums_x86_64=('77d761022c4e3e1e5c9814b59f8c8a55e940c69558216149ebd79aea57d3fa40')
sha256sums_i686=('18d1e506986aaa56b0736e7c771e7c46a9192ca59bba9807d3d0a237ea2409b0')
sha256sums_aarch64=('d967c1ba310d5de9037d71951841f53bdfb084bd5f7657bf89b567b26d7111e2')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
