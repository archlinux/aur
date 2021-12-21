pkgname=michaelas-harp-vst
pkgver=1.0.0
pkgrel=1
pkgdesc="Michaelas Celtic Harp (VST)"
arch=('x86_64')
license=('EULA')
url="https://librewave.com/product/michaelas-harp/"
groups=('pro-audio' 'vst-plugins')
depends=('glibc' 'libcurl-gnutls')
makedepends=('xdg-user-dirs')

prepare() {
	ln -srf "`xdg-user-dir DOWNLOAD`/Michaelas Harp ${pkgver}.sh" "${srcdir}/Michaelas Harp ${pkgver}.sh"
}

package() {
	sh "${srcdir}/Michaelas Harp ${pkgver}.sh" --tar xvf
	install -Dm755 "${srcdir}/Michaelas Harp.so" "${pkgdir}/usr/lib/vst/Michaelas Harp.so"
}
