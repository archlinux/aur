pkgname=sofia-woodwinds-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="Sofia Woodwinds (VST)"
arch=('x86_64')
license=('EULA')
url="https://librewave.com/product/sofia-woodwinds/"
groups=('pro-audio' 'vst-plugins')
depends=('glibc' 'libcurl-gnutls')
conflicts=('sofia-woodwinds-vst')
replaces=('sofia-woodwinds-vst')
makedepends=('xdg-user-dirs')

prepare() {
	ln -srf "`xdg-user-dir DOWNLOAD`/Sofia Woodwinds ${pkgver}.sh" "${srcdir}/Sofia Woodwinds ${pkgver}.sh"
}

package() {
	sh "${srcdir}/Sofia Woodwinds ${pkgver}.sh" --tar xvf
	install -Dm755 "${srcdir}/Sofia Woodwinds.so" "${pkgdir}/usr/lib/vst/Sofia Woodwinds.so"
	install -Dm755 "${srcdir}/Sofia Woodwinds" "${pkgdir}/usr/bin/Sofia Woodwinds"
}
