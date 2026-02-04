# Maintainer: Jasmin <theblazehen@gmail.com>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=screenpipe
_pkgname=screenpipe
pkgname=${_pkgname}-bin
pkgver=0.3.59
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
sha256sums=('7c8870ce4a6920da8c667759f25f7d99cdbbd45a40ea32978b34ab06e39c2f1f'
            '3a5bdfb91acdffb931dd89017dad495008d2ec9733306aa0583a1318f7a94658'
            'ea3e49f991612437374fb7fccab7c07ddd5831215d9ab1284a3c5304be68fcf1'
            'd62f9b5a4efa50ac07d89366a37957b75fb2552dad3b4a79e1bcd41a382ae975')
sha256sums_x86_64=('7e21aeb4963e0f884f536d43114a64ee2d569669c52788ba1443a97d7196a03e')

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

	install -Dm644 "README-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 "TESTING-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/TESTING.md"
	install -Dm644 "CONTRIBUTING-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/CONTRIBUTING.md"
}
