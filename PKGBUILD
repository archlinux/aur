# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=ddddddO
_pkgname=packemon
pkgname=${_pkgname}-bin
pkgver=1.8.17
pkgrel=1
pkgdesc="A TUI tool for sending packets of arbitrary input and monitoring packets on any network interfaces."
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=("BSD-2-Clause")

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}-${pkgrel}_amd64.deb")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}-${pkgrel}_arm64.deb")
sha256sums=('fdcd2452a52c79ce8d1a57390a43d60acddb1413696fc119ca124543f9d988f4'
            '21cc6f6a7a05ac27bbbaa6701a4071d50c699e696c088b710eb1c6772df32011')
sha256sums_x86_64=('6c1f037cfc8cfd7cd4fc5b4481f87e0bfc70f084fec9175aa4db5bf02cbf4f6b')
sha256sums_aarch64=('15705d9674d6c1ce33daadf40782f9c92148380e2eb6bd1e822ea524c6494523')


package() {
	cd "${pkgdir}"

	# this extracts all into the pkgdir
	tar xf "${srcdir}/data.tar.gz"

	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "./usr/share/licenses/$pkgname/LICENSE"

	install -Dm644 "${srcdir}/README-${pkgver}" "./usr/share/doc/$pkgname/README.md"
}
