# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=stefanlogue
_pkgname=meteor
pkgname=${_pkgname}-bin
pkgver=0.29.0
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="A highly configurable CLI tool for writing conventional commits"
arch=('x86_64' 'i686' 'aarch64')
_barch=('amd64' '386' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[0]}.zip")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[1]}.zip")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[2]}.zip")
sha256sums_x86_64=('05d942e07be28f59bb432ebdc04f16bca9164a188fba6ff7ea08e1cbdc0550c6')
sha256sums_i686=('08f2c7ee56e930852b37dc8ee0b25fb1a917fe7cbb161a30ee36d6f1547c07e5')
sha256sums_aarch64=('3637580ae6d286795d46120842b8ffcadca98c3d6b9791b33fef52013b2bbea0')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
