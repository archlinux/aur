# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=ddddddO
_pkgname=packemon
pkgname=${_pkgname}-bin
pkgver=1.8.0
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
            '6ee7ff164d860a66791ad413c18c60e9968fcca85ba67c8146ce9c54b29c5baa')
sha256sums_x86_64=('ce43bf3919a3f46655b3451d6366488dc3b28ef6d7181ccbd0d69d5bc4fa51c6')
sha256sums_aarch64=('8d8036489bff182934cdfd2fd903d39dca6f42d9feb37c2d37759ce847b7f61c')


package() {
	cd "${pkgdir}"

	# this extracts all into the pkgdir
	tar xf "${srcdir}/data.tar.gz"

	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "./usr/share/licenses/$pkgname/LICENSE"

	install -Dm644 "${srcdir}/README-${pkgver}" "./usr/share/doc/$pkgname/README.md"
}
