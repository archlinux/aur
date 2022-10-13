# Maintainer: Robin Candau <robincandau[at]protonmail[dot]com>

pkgname=gnome-shell-extension-desktop-icons-neo
_pkgname=desktop-icons-neo
pkgver=1.4.2
pkgrel=1
pkgdesc='A fork of Desktop Icons NG that adds a whole bunch of new features and polish'
arch=('any')
url="https://github.com/DEM0NAssissan7/desktop-icons-neo"
license=('GPL3')
depends=('gnome-shell' 'gnome-shell-extensions' 'nautilus')
makedepends=('meson' 'ninja')
source=("${pkgname}-${pkgver}::${url}/archive/${pkgver}-LTS.tar.gz")
sha256sums=('4a6e5b25cf53cfb320fe25f774b4741499cf87e0eac767fd19407b32e2481e57')

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}-LTS"
    	install -d "${pkgdir}/usr/share/gnome-shell/extensions" 
    	meson --prefix=${pkgdir}/usr/ .build
    	ninja -C .build install
    	rm "${pkgdir}/usr/share/glib-2.0/schemas/gschemas.compiled"
}
