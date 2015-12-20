# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
# Contributor: foalsrock <foalsrock at gmail dot-com>

pkgname=moslight-themes-git
pkgver=r183.58a4334
pkgrel=1
pkgdesc="Slick GTK 2/3 and GNOME Shell themes resembling the elementary look"
arch=('any')
url="http://dasnoopy.deviantart.com/art/MosLight-3-12-448823771"
license=('GPL2')
depends=('gtk-engine-murrine' 'gtk-engines' 'gnome-themes-standard')
makedepends=('git')
source=("${pkgname}::git://github.com/dasnoopy/moslight-themes")
sha512sums=('SKIP')

pkgver() {
	cd "${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${pkgname}"
	mkdir -p "${pkgdir}/usr/share/themes"
	for i in Light Emite Sky Cloud ; do
		cp -r "Mos${i}" "${pkgdir}/usr/share/themes/Mos${i}"
	done
}
