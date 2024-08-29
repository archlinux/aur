pkgbase=rhapsody-bin
pkgname=("rhapsody-sampler-standalone-bin" "rhapsody-sampler-vst3-bin")
pkgver=2.5.1
pkgrel=1
arch=('x86_64')
license=('EULA')
url="https://librewave.com/rhapsody/"
source=('Rhapsody Sampler.desktop')
depends=('alsa-lib' 'bzip2' 'brotli' 'curl' 'freetype2' 'glibc' 'graphite' 'harfbuzz' 'keyutils' 'krb5' 'libcurl-gnutls' 'libnghttp2' 'libnghttp3' 'libidn2' 'libpng' 'libpsl' 'libssh2' 'libunistring' 'nettle' 'openssl' 'pcre2' 'zlib' 'zstd')
makedepends=('xdg-user-dirs' 'unzip')
sha256sums=('6b68320ae7932b5bb707ead91f46fc8a44d42dcd7811305c2da3c05e4e37785d')

prepare() {
	ln -srf "`xdg-user-dir DOWNLOAD`/Rhapsody.Linux.${pkgver}.zip" "${srcdir}/Rhapsody Linux ${pkgver}.zip"
	unzip "${srcdir}/Rhapsody Linux ${pkgver}.zip"
}

package_rhapsody-sampler-standalone-bin() {
	pkgdesc="Rhapsody Sampler (Standalone)"
	groups=('pro-audio')
	install -Dm755 "${srcdir}/Rhapsody" "${pkgdir}/usr/bin/Rhapsody"
	install -Dm755 "${srcdir}/Rhapsody Sampler.desktop" "${pkgdir}/usr/share/applications/Rhapsody Sampler.desktop"
	install -Dm644 "${srcdir}/Icon.png" "${pkgdir}/usr/share/icons/hicolor/458x458/apps/rhapsody-sampler.png"
	install -Dm644 "${srcdir}/License.txt" "${pkgdir}/usr/share/doc/rhapsody-sampler/license"
}

package_rhapsody-sampler-vst3-bin() {
	pkgdesc="Rhapsody Sampler (VST3)"
	groups=('pro-audio' 'vst3-plugins')
	install -Dm755 "${srcdir}/Rhapsody.vst3/Contents/x86_64-linux/Rhapsody.so" "${pkgdir}/usr/lib/vst3/Rhapsody.vst3/Contents/x86_64-linux/Rhapsody.so"
}
