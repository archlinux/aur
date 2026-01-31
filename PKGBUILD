# Maintainer: Jasmin <theblazehen@gmail.com>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=mediar-ai
_pkgname=screenpipe
pkgname=${_pkgname}-bin
pkgver=0.2.74
pkgrel=1
pkgdesc="24/7 Screen and Audio Capture with AI-powered tools"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs' 'libxcb' 'dbus' 'openssl' 'alsa-lib' 'xz' 'xdotool')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE.md"
        "README-${pkgver}::${_urlraw}/README.md"
        "TESTING-${pkgver}::${_urlraw}/TESTING.md"
        "CONTRIBUTING-${pkgver}::${_urlraw}/CONTRIBUTING.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-${arch[0]}-unknown-linux-gnu.tar.gz")
sha256sums=('fb72ea7f10634208c877c393401cd02676816f2e45367b20d28405f5b719b9b6'
            'd3e40ef47c733168caf9042c1f25c435f2a961ea28f4a2162de34d560b853388'
            '5c92311c6d78302508543460ab84acd24688a62d4b44674042524a6be0903bb0'
            'de6bfe4b5b12bdb632ed7c165fb7eec975edd25255cf08d0468a1776fc1ca9d3')
sha256sums_x86_64=('d2d95ea2ec82779fbc661f1b7feffcccfdfaaa6717d821a4dbcf23583620b770')

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

	install -Dm644 "README-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 "TESTING-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/TESTING.md"
	install -Dm644 "CONTRIBUTING-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/CONTRIBUTING.md"
}
