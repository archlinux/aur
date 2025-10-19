# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=sharkdp
_pkgname=lscolors
pkgname=${_pkgname}-bin
pkgver=0.21.0
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="A tool to colorize paths using LS_COLORS"
arch=('x86_64' 'i686' 'aarch64')
_barch=('x86_64' 'i686' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('Apache-2.0' 'MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs')

_archive_suffix="unknown-linux-gnu"
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[0]}-${_archive_suffix}.tar.gz")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[1]}-${_archive_suffix}.tar.gz")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[2]}-${_archive_suffix}.tar.gz")
sha256sums_x86_64=('ae917b96439fa04f91db234db25a946abe317f79ed3f5a89bd569a1bc5621299')
sha256sums_i686=('da31497674e75bedba9ed4ec54513abebf8d14046dbe335b0e491775e05882ea')
sha256sums_aarch64=('11d336ebbd71c80a178148428f14d4af39750e4314f9122e98d8ed12c21753d5')

BIN_PATH="${_pkgname}-${_pkgvername}-${CARCH}-${_archive_suffix}"

package() {
	cd "${srcdir}/${BIN_PATH/}" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
	install -Dm644 "LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}

