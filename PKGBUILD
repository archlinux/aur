# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=jorgerojas26
_pkgname=lazysql
pkgname=${_pkgname}-bin
pkgver=0.5.4
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
            '4469deffb03976847b6cbbf20274e7a12970ae62132bd347eda05bea9070fa6f')
sha256sums_x86_64=('0471e340e4038bae2c04bf36744d5d5c9864afa488f3bd28e975397cc64851a4')
sha256sums_i686=('66dcd261f5969394b4c232a7d80b16067f2c06b6945963980aa0c22a4e2fa181')
sha256sums_aarch64=('cbb094d85cc44e6ee609a8c3e16c1bf32df0609a927ac2750b348aa181d57d78')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

	install -Dm644 "README-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
