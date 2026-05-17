# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=ddddddO
_pkgname=packemon
pkgname=${_pkgname}-bin
pkgver=1.8.23
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
            'ad8d8bdf3bb4d0bd2c53009e591117d9f5da4929143717dfcd1ae0d0a2a43278')
sha256sums_x86_64=('96a0bf06ad77ea7c8b11b72d04c53eed87bad0e26eecf1e42018160bd1b3407b')
sha256sums_aarch64=('6ec6ca3a26013a708eb5338f3b7bcda0946b1f3b592001afb0d88c2386721acc')


package() {
	cd "${pkgdir}"

	# this extracts all into the pkgdir
	tar xf "${srcdir}/data.tar.gz"

	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "./usr/share/licenses/$pkgname/LICENSE"

	install -Dm644 "${srcdir}/README-${pkgver}" "./usr/share/doc/$pkgname/README.md"
}
