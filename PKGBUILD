# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=DaltonSW
_pkgname=stylish
pkgname=${_pkgname}-bin
pkgver=1.1
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="Simple and intuitive lscolors configuration. Put that glam in your term"
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
sha256sums_x86_64=('670699ebe8a07b250aa71a7459ecc32402a2ded7a9fea48453aef5f27f3c5811')
sha256sums_i686=('be3de61e3ff4f1ae673f3e6c30988dac39239bb5093968db9e5cbe4606fedc0e')
sha256sums_aarch64=('43fa175beed797fd4b04f8c98009d7323696094d29f4c79b075a7aa509ca00d2')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
