pkgbase=omalleys-irish-whistles-bin
pkgname=("omalleys-irish-whistles-standalone-bin" "omalleys-irish-whistles-vst-bin")
pkgver=1.0.0
pkgrel=4
arch=('x86_64')
license=('EULA')
url="https://librewave.com/product/omalleys-irish-whistles/"
depends=('alsa-lib' 'bzip2' 'brotli' 'freetype2' 'glibc' 'graphite' 'harfbuzz' 'keyutils' 'krb5' 'libcurl-gnutls' 'libffi' 'libnghttp2' 'libidn2' 'libp11-kit' 'libpng' 'libpsl' 'libssh2' 'libtasn1' 'libunistring' 'libxau' 'libxcb' 'libx11' 'nettle' 'openssl' 'pcre2' 'zlib' 'zstd')
makedepends=('xdg-user-dirs')
source=("OMalleys Irish Whistles.desktop")
sha256sums=('b5f9a59f02ac5392535b5cf63a53ca21766df7d168836668c8c1e2a317149aa4')

prepare() {
	ln -srf "`xdg-user-dir DOWNLOAD`/OMalleys Irish Whistles ${pkgver}.sh" "${srcdir}/OMalleys Irish Whistles ${pkgver}.sh"
	sh "${srcdir}/OMalleys Irish Whistles ${pkgver}.sh" --tar xvf
}

package_omalleys-irish-whistles-standalone-bin() {
	pkgdesc="OMalleys Irish Whistles (Standalone)"
	groups=('pro-audio')
	install -Dm755 "${srcdir}/OMalleys Irish Whistles" "${pkgdir}/usr/bin/OMalleys Irish Whistles"
	install -Dm644 "${srcdir}/OMalleys Irish Whistles.desktop" "${pkgdir}/usr/share/applications/OMalleys Irish Whistles.desktop"
}

package_omalleys-irish-whistles-vst-bin() {
	pkgdesc="OMalleys Irish Whistles (VST)"
	groups=('pro-audio' 'vst-plugins')
	conflicts=('omalleys-irish-whistles-vst')
	replaces=('omalleys-irish-whistles-vst')
	install -Dm755 "${srcdir}/OMalleys Irish Whistles.so" "${pkgdir}/usr/lib/vst/OMalleys Irish Whistles.so"
}
