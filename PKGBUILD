# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=mediar-ai
_pkgname=screenpipe
pkgname=${_pkgname}-bin
pkgver=0.2.58
pkgrel=1
pkgdesc="24/7 Screen and Audio Capture with AI-powered tools"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs' 'libxcb' 'dbus' 'openssl' 'alsa-lib' 'xz')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE.md"
        "README-${pkgver}::${_urlraw}/README.md"
        "TESTING-${pkgver}::${_urlraw}/TESTING.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-${arch[0]}-unknown-linux-gnu.tar.gz")
sha256sums=('fb72ea7f10634208c877c393401cd02676816f2e45367b20d28405f5b719b9b6'
            '84881b5e42719dd8a7194eaf71a57db13a2831968163da4ff43fe7266f3c1bcd'
            '29b86d243f0aab2b1dbedc5100f18d08e61134172426d5f48fbb273a787f8415')
sha256sums_x86_64=('e7ea13c8bde6a8bfdef2ac057dd27c42d711d384375b6a6e1a5375b83c159d7f')

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

	install -Dm644 "README-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 "TESTING-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/TESTING.md"
}
