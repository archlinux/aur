# Maintainer: Markus Kitsinger (SwooshyCueb) <root@swooshalicio.us>

_pkgbase=curl-impersonate
pkgbase=${_pkgbase}-lexiforest-bin
pkgname=("${pkgbase}" "lib${pkgbase}")
pkgver=0.8.0
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
	"0344b24d4dc078ecd98659621ce0bf2b89184f444e1962b85a7a58d3c7bb3cdc"
	"9df90fd15bb49a1a374eeb56d07018dd89e3d45958efb7166dc8564654cd282d"
)
sha256sums_i686=(
	"36517c47ce0b8b6c95e1313be10199e40720560a89e897db1376c103db90402b"
	"0caf1a14c456bf85c2409e52933473a46d8b2508dc26f6ebb0337abd14d6b506"
)
sha256sums_armv7h=(
	"7e5d01e277d52a6c064603bbf7a1e45b64267ab9a1bc7ad308c7064552e951e5"
	"ff53d1f5693978dec3a0a863413819cdb99eaf8a67a8df55f3ca05702c6656f1"
)
sha256sums_aarch64=(
	"78757d5607b741b5fa850e411e6b990825420272266d388e15ccb0e067bc2ba9"
	"d1930207c6f0bdce79963b8dfdfd87189aad2294e200f17d8335a5fc2dbe9ca3"
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
