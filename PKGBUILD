pkgbase=sofia-woodwinds-bin
pkgname=("sofia-woodwinds-standalone-bin" "sofia-woodwinds-vst-bin")
pkgver=1.1.1
pkgrel=2
arch=('x86_64')
license=('EULA')
url="https://librewave.com/product/sofia-woodwinds/"
depends=('alsa-lib' 'bzip2' 'brotli' 'freetype2' 'glibc' 'graphite' 'harfbuzz' 'keyutils' 'krb5' 'libcurl-gnutls' 'libffi' 'libnghttp2' 'libidn2' 'libp11-kit' 'libpng' 'libpsl' 'libssh2' 'libtasn1' 'libunistring' 'libxau' 'libxcb' 'libx11' 'nettle' 'openssl' 'pcre2' 'zlib' 'zstd')
makedepends=('xdg-user-dirs')

prepare() {
	ln -srf "`xdg-user-dir DOWNLOAD`/Sofia Woodwinds ${pkgver}.sh" "${srcdir}/Sofia Woodwinds ${pkgver}.sh"
	sh "${srcdir}/Sofia Woodwinds ${pkgver}.sh" --tar xvf
}

package_sofia-woodwinds-standalone-bin() {
	pkgdesc="Sofia Woodwinds (Standalone)"
	install -Dm755 "${srcdir}/Sofia Woodwinds" "${pkgdir}/usr/bin/Sofia Woodwinds"
}

package_sofia-woodwinds-vst-bin() {
	pkgdesc="Sofia Woodwinds (VST)"
	groups=('pro-audio' 'vst-plugins')
	conflicts=('sofia-woodwinds-vst')
	replaces=('sofia-woodwinds-vst')
	install -Dm755 "${srcdir}/Sofia Woodwinds.so" "${pkgdir}/usr/lib/vst/Sofia Woodwinds.so"
}
