pkgname=omalleys-irish-whistles-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="OMalleys Irish Whistles (VST)"
arch=('x86_64')
license=('EULA')
url="https://librewave.com/product/omalleys-irish-whistles/"
groups=('pro-audio' 'vst-plugins')
depends=('glibc' 'libcurl-gnutls')
conflicts=('omalleys-irish-whistles-vst')
replaces=('omalleys-irish-whistles-vst')
makedepends=('xdg-user-dirs')

prepare() {
	ln -srf "`xdg-user-dir DOWNLOAD`/OMalleys Irish Whistles ${pkgver}.sh" "${srcdir}/OMalleys Irish Whistles ${pkgver}.sh"
}

package() {
	sh "${srcdir}/OMalleys Irish Whistles ${pkgver}.sh" --tar xvf
	install -Dm755 "${srcdir}/OMalleys Irish Whistles.so" "${pkgdir}/usr/lib/vst/OMalleys Irish Whistles.so"
	install -Dm755 "${srcdir}/OMalleys Irish Whistles" "${pkgdir}/usr/bin/OMalleys Irish Whistles"
}
