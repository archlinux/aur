# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=ddddddO
_pkgname=packemon
pkgname=${_pkgname}-bin
pkgver=1.8.14
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
            'cea391611d58514e046ff10241c13d34a7398b8bbd9741309d691ca17f176b1b')
sha256sums_x86_64=('cb8e2beece7318d7edc8ff0bd4ae8def7b261bc41895e57efddd57b14f41e470')
sha256sums_aarch64=('148617cdd387263ecedcd02982ef8ece741c1a58fdc08082c79ba70909bb2db6')


package() {
	cd "${pkgdir}"

	# this extracts all into the pkgdir
	tar xf "${srcdir}/data.tar.gz"

	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "./usr/share/licenses/$pkgname/LICENSE"

	install -Dm644 "${srcdir}/README-${pkgver}" "./usr/share/doc/$pkgname/README.md"
}
