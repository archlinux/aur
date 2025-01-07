# Maintainer: Markus Kitsinger (SwooshyCueb) <root@swooshalicio.us>

_pkgbase=curl-impersonate
pkgbase=${_pkgbase}-lexiforest-bin
pkgname=("${pkgbase}" "lib${pkgbase}")
pkgver=0.8.2
pkgrel=1
pkgdesc="Special build of curl that can impersonate browsers (lexiforest's fork)"
url="https://github.com/lexiforest/curl-impersonate"
license=('MIT')
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
depends=(ca-certificates zstd nss)

source_x86_64=(
	"curl-impersonate_x86_64.tar.gz::https://github.com/lexiforest/curl-impersonate/releases/download/v${pkgver}/curl-impersonate-v${pkgver}.x86_64-linux-gnu.tar.gz"
	"libcurl-impersonate_x86_64.tar.gz::https://github.com/lexiforest/curl-impersonate/releases/download/v${pkgver}/libcurl-impersonate-v${pkgver}.x86_64-linux-gnu.tar.gz"
)
source_i686=(
	"curl-impersonate_i686.tar.gz::https://github.com/lexiforest/curl-impersonate/releases/download/v${pkgver}/curl-impersonate-v${pkgver}.i386-linux-gnu.tar.gz"
	"libcurl-impersonate_i686.tar.gz::https://github.com/lexiforest/curl-impersonate/releases/download/v${pkgver}/libcurl-impersonate-v${pkgver}.i386-linux-gnu.tar.gz"
)
source_aarch64=(
	"curl-impersonate_aarch64.tar.gz::https://github.com/lexiforest/curl-impersonate/releases/download/v${pkgver}/curl-impersonate-v${pkgver}.aarch64-linux-gnu.tar.gz"
	"libcurl-impersonate_aarch64.tar.gz::https://github.com/lexiforest/curl-impersonate/releases/download/v${pkgver}/libcurl-impersonate-v${pkgver}.aarch64-linux-gnu.tar.gz"
)
source_armv7h=(
	"curl-impersonate_armv7h.tar.gz::https://github.com/lexiforest/curl-impersonate/releases/download/v${pkgver}/curl-impersonate-v${pkgver}.arm-linux-gnueabihf.tar.gz"
	"libcurl-impersonate_armv7h.tar.gz::https://github.com/lexiforest/curl-impersonate/releases/download/v${pkgver}/libcurl-impersonate-v${pkgver}.arm-linux-gnueabihf.tar.gz"
)

sha256sums_x86_64=(
	'49da0fd6c60a2868495ac0bba41e8baa3a42c6f49942b9c96e0672c1af495f45'
	'0d8370f8735f0ea3a2b84cf4fe682b6983678d6fab3725ff744f0bcd4e8251c5'
)
sha256sums_i686=(
	'8d9454eb5f6ea86c9f25f030e9322dc59673d25c4ca22f13305ee8eca58d494d'
	'a8c4bd31d78505f0357ca4e6332d0505555942a4461aa55c0a9691e07e6478f9'
)
sha256sums_armv7h=(
	'abd5e17be31113287bcac97cd4363de7fb3c33accdbb3f4b60f625a9b60a6ed4'
	'fd4394babedda31c96de2af93be35179ea72e1d885c886f0cb175fd200794c7b'
)
sha256sums_aarch64=(
	'1d608376aedd58b62d9f6a430da3f18fabfce0fd71d753531dfaef042e0ca0d9'
	'f1d0623a526ebd474bf7ceea8a4578aa12e15d6d8c677f3017499a0037d02389'
)

package_libcurl-impersonate-lexiforest-bin() {
	provides=(libcurl-impersonate-chrome)
	install -Ddm755 "${pkgdir}/usr/lib"
	cp -a --no-preserve=ownership libcurl-impersonate-chrome.so* "${pkgdir}/usr/lib/"
}

package_curl-impersonate-lexiforest-bin() {
	# statically compiled, so no need for dependency on lib
	provides=(curl-impersonate-chrome)
	install -Ddm755 "${pkgdir}/usr/bin"
	install -Dm755 curl_chrome* "${pkgdir}/usr/bin/"
	install -Dm755 curl_edge* "${pkgdir}/usr/bin/"
	install -Dm755 curl_safari* "${pkgdir}/usr/bin/"
	install -Dm755 curl-impersonate-chrome "${pkgdir}/usr/bin/"
}
