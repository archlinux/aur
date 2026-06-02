# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=jorgerojas26
_pkgname=lazysql
pkgname=${_pkgname}-bin
pkgver=0.5.3
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
            '6146b95f275073df8eb77e0e4790ff5ab3bdc79ecddb0de3113ec3be484e6d8a')
sha256sums_x86_64=('4865ae00a7ef5ff0b37cbdbb1f3ec65795498939ac8f260d0823f3566718580d')
sha256sums_i686=('e0ed6b434762f289a17896a0f140ea926dce9f47a9b0c769d9a1bf3f2db5c4d8')
sha256sums_aarch64=('4e6a2289355009205e16edeeb63a8b3716a178c9f8ad11dd82cbd89952ab39b2')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

	install -Dm644 "README-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
