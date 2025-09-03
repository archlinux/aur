# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Adembc
_pkgname=lazyssh
pkgname=${_pkgname}-bin
pkgver=0.2.0
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
sha256sums_x86_64=('ca8176906ed7281e023f045c0f69ca8ee5579d99e2777b748483ddab117aef17')
sha256sums_i686=('5cb4e71eef7e7f05b1d92233cb84ef6ca2f6994f4497435e6a6117be41396188')
sha256sums_aarch64=('04a9de5f21d3578eca78a7ca894818e411925a62dbafb43f32525909039388d1')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
