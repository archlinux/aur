pkgname=rhapsody-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="Rhapsody Sampler (VST3)"
arch=('x86_64')
license=('EULA')
url="https://librewave.com/rhapsody/"
groups=('pro-audio' 'vst3-plugins')
depends=('glibc' 'libcurl-gnutls')
makedepends=('xdg-user-dirs' 'unzip')

prepare() {
	ln -srf "`xdg-user-dir DOWNLOAD`/Rhapsody Linux ${pkgver}.zip" "${srcdir}/Rhapsody Linux ${pkgver}.zip"
	unzip "${srcdir}/Rhapsody Linux ${pkgver}.zip"
}

package() {
	install -Dm755 "${srcdir}/Rhapsody.vst3/Contents/x86_64-linux/Rhapsody.so" "${pkgdir}/usr/lib/vst3/Rhapsody.vst3/Contents/x86_64-linux/Rhapsody.so"
	install -Dm755 "${srcdir}/Rhapsody" "${pkgdir}/usr/bin/Rhapsody"
}
