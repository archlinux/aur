# Maintainer: Martin Rys <https://rys.rs/contact> | Fund my existence on https://rys.rs/donate
# Previous Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

_pkgname=Flatseal
pkgname=flatseal
pkgver=2.3.0
pkgrel=1
pkgdesc='A permissions manager for Flatpak.'
url="https://github.com/tchx84/Flatseal/"
arch=('any')
license=('GPL-3.0-or-later')
depends=('flatpak' 'gjs' 'webkitgtk-6.0' 'libhandy' 'appstream-glib' 'libadwaita')
makedepends=('meson' 'flatpak-builder' 'ninja')
source=("${pkgname}-${pkgver}::https://github.com/tchx84/Flatseal/archive/v${pkgver}.tar.gz")
sha256sums=('ff00c55a3c243469d056b248ad9a6c3b2f9c70f383f2190f66919abf48f74312')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	meson setup --prefix /usr --buildtype=plain . build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	DESTDIR="${pkgdir}" meson install -C build
}
