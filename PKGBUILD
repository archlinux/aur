# Maintainer: basigur

pkgname=neru-icon-classic-theme
pkgver=2.4
pkgrel=3
pkgdesc="Classic theme icons Neru"
arch=('any')
url="https://github.com/chistota/neru-icon-classic-theme"
license=('LGPL3')
depends=('gtk-update-icon-cache' 'librsvg' 'hicolor-icon-theme')
replaces=('neru-icon-classic-theme')
conflicts=()
source=("https://github.com/chistota/"${pkgname}"/archive/v"${pkgver}".tar.gz")
sha512sums=('22F8E2AB6622082800C954D03409F9C5D018A4E309CFE9E315FE361383DAA0F04E577D31B7B45A085A167EBCC9D7F87CAA72C5EBD4428A62BDF1548C1BC54999')

package() {

	tar -xzf v${pkgver}.tar.gz
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
