pkgname=kazbek-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Kazbek Woodwinds (VST)"
arch=('x86_64')
license=('EULA')
url="https://librewave.com/product/kazbek/"
groups=('pro-audio' 'vst-plugins')
depends=('glibc' 'libcurl-gnutls')
conflicts=('kazbek-vst')
replaces=('kazbek-vst')
makedepends=('xdg-user-dirs')

prepare() {
	ln -srf "`xdg-user-dir DOWNLOAD`/Kazbek ${pkgver}.sh" "${srcdir}/Kazbek ${pkgver}.sh"
}

package() {
	sh "${srcdir}/Kazbek ${pkgver}.sh" --tar xvf
	install -Dm755 "${srcdir}/Kazbek.so" "${pkgdir}/usr/lib/vst/Kazbek.so"
	install -Dm755 "${srcdir}/Kazbek" "${pkgdir}/usr/bin/Kazbek"
}
