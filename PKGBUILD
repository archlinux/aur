# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=sharkdp
_pkgname=lucid
pkgname=${_pkgname}-bin
pkgver=0.3.0
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="A simple mock-application for programs that work with child processes"
arch=('x86_64')
_barch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('Apache-2.0' 'MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'libgcc')

_archive_suffix="unknown-linux-gnu"
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[0]}-${_archive_suffix}.tar.gz")
sha256sums_x86_64=('f2485b0b2e2152feb7e977be6b400a9075b2925647b92b6f812eff84c8de7c93')

BIN_PATH="${_pkgname}-${_pkgvername}-${CARCH}-${_archive_suffix}"

package() {
	cd "${srcdir}/${BIN_PATH/}" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
	install -Dm644 "LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}

