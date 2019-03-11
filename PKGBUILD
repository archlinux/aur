# Maintainer: basigur

pkgname=neru-icon-classic-theme
pkgver=2.6
pkgrel=1
pkgdesc="Classic theme icons Neru"
arch=('any')
url="https://github.com/chistota/neru-icon-classic-theme"
license=('LGPL3')
depends=('gtk-update-icon-cache' 'librsvg' 'hicolor-icon-theme')
replaces=('neru-icon-classic-theme')
conflicts=()
source=("https://github.com/chistota/"${pkgname}"/archive/v"${pkgver}".tar.gz")
sha512sums=('B6979D21766581FD82108BB20E2DD778BAD95801049DBBA5DD7F953323E5E3B666DE1B4D84F90E6088EBACFC0CFD64A1B04C9D690195358D8917AC23B7C47683')

package() {

	cd "$srcdir"/"${pkgname}-${pkgver}"
	install -d "$pkgdir/usr/share/icons"
	install -d "$pkgdir/usr/share/doc/${pkgname}"
	install -d "$pkgdir/usr/share/licenses/${pkgname}"

	ln -s document-viewer.svg neru-classic-light/32x32/apps/graphics-viewer-document.svg
	ln -s document-viewer.svg neru-classic-light/32x32/apps/org.gnome.Evince.svg
	ln -s document-viewer.svg neru-classic-light/32x32/apps/xpdf9.svg
	ln -s document-viewer.svg neru-classic-light/32x32/apps/accessories-document-viewer.svg
	ln -s qv4l2.svg neru-classic-light/32x32/apps/qvidcap.svg
	ln -s usb-creator.svg neru-classic-light/32x32/apps/mintstick.svg

	gtk-update-icon-cache neru-classic-light/
	gtk-update-icon-cache neru-classic-dark/
	gtk-update-icon-cache neru-classic-light-green/
	gtk-update-icon-cache neru-classic-dark-green/
	gtk-update-icon-cache neru-classic-light-yellow/
	gtk-update-icon-cache neru-classic-dark-yellow/

cp -r {'neru-classic-light','neru-classic-dark','neru-classic-light-green','neru-classic-dark-green','neru-classic-light-yellow','neru-classic-dark-yellow'} "$pkgdir"/usr/share/icons/
	cp -r LICENSE "$pkgdir"/usr/share/licenses/"${pkgname}"/
	cp -r {README.md,AUTHORS} "$pkgdir"/usr/share/doc/"${pkgname}"/

}
