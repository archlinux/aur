# Maintainer: basigur

pkgname=neru-icon-newyear-theme
pkgver=1.0
pkgrel=3
pkgdesc="Christmas theme icons Neru"
arch=('any')
url="https://github.com/chistota/neru-icon-newyear-theme/"
license=('LGPL3')
depends=('gtk-update-icon-cache' 'librsvg' 'hicolor-icon-theme')
replaces=(neru-icon-newyear-theme)
conflicts=()
source=("https://github.com/chistota/"${pkgname}"/archive/v"${pkgver}".tar.gz")
sha512sums=('bccacbdd05de2ee4fd50c6bd842c8266ccae3fc120d624aae7bbdebd9b3f5ac7ca8bb123a34d085a5c35d5e141d62eb79a55a2c052d39d5f84a0a3bf1f2833a8')


package() {
	tar -xzf v${pkgver}.tar.gz
	cd "$srcdir"/"${pkgname}-${pkgver}"
	install -d "$pkgdir/usr/share/icons"
	install -d "$pkgdir/usr/share/doc/${pkgname}"
	install -d "$pkgdir/usr/share/licenses/${pkgname}"

	ln -s document-viewer.svg neru-newyear-light/medium/apps/graphics-viewer-document.svg
	ln -s document-viewer.svg neru-newyear-light/medium/apps/org.gnome.Evince.svg
	ln -s document-viewer.svg neru-newyear-light/medium/apps/xpdf9.svg
	ln -s document-viewer.svg neru-newyear-light/medium/apps/accessories-document-viewer.svg

	ln -s qv4l2.svg neru-newyear-light/medium/apps/qvidcap.svg
	ln -s usb-creator.svg neru-newyear-light/medium/apps/mintstick.svg

	ln -s document-viewer.svg neru-newyear-dark/medium/apps/graphics-viewer-document.svg
	ln -s document-viewer.svg neru-newyear-dark/medium/apps/org.gnome.Evince.svg
	ln -s document-viewer.svg neru-newyear-dark/medium/apps/xpdf9.svg
	ln -s document-viewer.svg neru-newyear-dark/medium/apps/accessories-document-viewer.svg

	ln -s qv4l2.svg neru-newyear-dark/medium/apps/qvidcap.svg
	ln -s usb-creator.svg neru-newyear-dark/medium/apps/mintstick.svg

	gtk-update-icon-cache neru-newyear-light/
	gtk-update-icon-cache neru-newyear-dark/


	cp -r {'neru-newyear-dark','neru-newyear-light'} "$pkgdir"/usr/share/icons/

	cp -r LICENSE "$pkgdir"/usr/share/licenses/"${pkgname}"/
	cp -r {README.md,AUTHORS,screenshot.svg} "$pkgdir"/usr/share/doc/"${pkgname}"/
}
