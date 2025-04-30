# Maintainer: Martin Rys <https://rys.rs/contact> | Fund my existence on https://rys.rs/donate
# Previous Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

_pkgname=Flatseal
pkgname=flatseal
pkgver=2.3.1
pkgrel=1
pkgdesc='A permissions manager for Flatpak.'
url="https://github.com/tchx84/Flatseal/"
arch=('any')
license=('GPL-3.0-or-later')
depends=('flatpak' 'gjs' 'webkitgtk-6.0' 'libhandy' 'appstream-glib' 'libadwaita')
makedepends=('meson' 'flatpak-builder' 'ninja')
source=("${pkgname}-${pkgver}::https://github.com/tchx84/Flatseal/archive/v${pkgver}.tar.gz")
sha256sums=('0a456c5e67820f1924b38451767049f9d8784f9dd36857e287275d685156ef9c')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	meson setup --prefix /usr --buildtype=plain . build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	DESTDIR="${pkgdir}" meson install -C build
}
