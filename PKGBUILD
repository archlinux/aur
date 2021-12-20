pkgname=kazbek-vst
pkgver=1.0.1
pkgrel=1
pkgdesc="Kazbek Woodwinds (VST)"
arch=('x86_64')
license=('EULA')
url="https://librewave.com/product/kazbek/"
groups=('pro-audio' 'vst-plugins')
depends=('glibc' 'libcurl-gnutls')
makedepends=('xdg-user-dirs')

prepare() {
	ln -srf "`xdg-user-dir DOWNLOAD`/Kazbek ${pkgver}.sh" "${srcdir}/Kazbek ${pkgver}.sh"
}

package() {
	sh "${srcdir}/Kazbek ${pkgver}.sh" --tar xvf
	install -Dm755 "${srcdir}/Kazbek.so" "${pkgdir}/usr/lib/vst/Kazbek.so"
}
