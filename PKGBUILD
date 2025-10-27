# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=jorgerojas26
_pkgname=lazysql
pkgname=${_pkgname}-bin
pkgver=0.4.3
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
            '081864a7b4482959d9fa7a5078455fbd4bac9e337bdcd9e9254bd82d98b86e27')
sha256sums_x86_64=('55ecd0aca11410e0e2b6795edbf5619b6f6a34deebda4411340da1e0423ff23f')
sha256sums_i686=('82679c4469ae22b6c3e703de1df18dc5fb0390b32d42fcbe39e2f18a4741491a')
sha256sums_aarch64=('8d48717e5986bffebb4f6040f9f89ff120217d77ffa6984de719294cd6357cdb')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

	install -Dm644 "README-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
