# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=jorgerojas26
_pkgname=lazysql
pkgname=${_pkgname}-bin
pkgver=0.5.9
pkgrel=1
pkgdesc="A cross-platform TUI database management tool written in Go"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE.txt"
        "README-${pkgver}::${_urlraw}/README.md")
source_x86_64=("${_pkgname}_${pkgver}_${arch[0]}::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_x86_64.tar.gz")
source_i686=("${_pkgname}_${pkgver}_${arch[1]}::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_i386.tar.gz")
source_aarch64=("${_pkgname}_${pkgver}_${arch[2]}::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_arm64.tar.gz")
sha256sums=('d3624d0f12d16629f5a19146cf86b4d811a842df962c52e64a5e166692f498c3'
            '9d3fa2c47d709ffbc8aa0e7ebfba546db4a4a05eee9461258ea36d658f811bbb')
sha256sums_x86_64=('d392ee8fe4225e5d3d746f2610c1416709615cb37e6b0f44f35ff7c9bd56abaa')
sha256sums_i686=('e946070fadbb8c109482d4201a8ef18c3f643fedf23265155a2de014a6c2eb98')
sha256sums_aarch64=('24950c7bb1dc304df73415a3fd6fcf71b88d0ed88907a3403f67a40f5c2f6059')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

	install -Dm644 "README-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
