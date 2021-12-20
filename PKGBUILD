pkgname=collab3-vst
pkgver=1.0.0
pkgrel=1
pkgdesc="CollaB3 Tone Wheel Organ (VST)"
arch=('x86_64')
license=('EULA')
url="https://librewave.com/product/collab3/"
groups=('pro-audio' 'vst-plugins')
depends=('glibc' 'libcurl-gnutls')
makedepends=('xdg-user-dirs')

prepare() {
	## Extract Librewave Plugins Archive
	ln -sf "`xdg-user-dir DOWNLOAD`/CollaB3-Installer-${pkgver}.sh" "${srcdir}/CollaB3-Installer-${pkgver}.sh"
}

package() {
	sh "${srcdir}/CollaB3-Installer-${pkgver}.sh" --tar xvf
	install -Dm755 "${srcdir}/CollaB3.so" "${pkgdir}/usr/lib/vst/CollaB3.so"
}
