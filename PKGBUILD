# Maintainer: Martin Rys <rys.pw/contact>
# Previous Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

_pkgname=Flatseal
pkgname=flatseal
pkgver=2.1.1
pkgrel=1
pkgdesc='A permissions manager for Flatpak.'
url="https://github.com/tchx84/Flatseal/"
arch=('any')
license=('GPL-3.0-only')
depends=('flatpak' 'gjs' 'webkitgtk-6.0' 'libhandy' 'appstream-glib' 'libadwaita')
makedepends=('meson' 'flatpak-builder' 'ninja')
source=("${pkgname}-${pkgver}::https://github.com/tchx84/Flatseal/archive/v${pkgver}.tar.gz")
sha256sums=('b4e280a049a9f32ed8e7c4c0d903cacd4610c72ff58bc73d88ee5dbd3a937510')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	meson setup --prefix /usr --buildtype=plain . build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	DESTDIR="${pkgdir}" meson install -C build
}
