# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Adam Perkowski <adas1per@protonmail.com>

_pkgauthor=codesnap-rs
_pkgname=codesnap
pkgname=${_pkgname}-bin
pkgver=0.12.10
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="Pure Rust tool for generating beautiful code snapshots"
arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

depends=('gcc-libs' 'glibc' 'oniguruma')
conflicts=("${_pkgname}")
provides=("${_pkgname}")

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-cli_${_pkgvername}_${_barch[0]}-unknown-linux-gnu.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-cli_${_pkgvername}_${_barch[1]}-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('908738fc53e19f1a45081949f86e8901caebb81eb197e381c104f1683c35cb81')
sha256sums_aarch64=('06b10bf51b1bdf77347db1b8fc3d775107668f70e488530d3c578718011453ab')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
