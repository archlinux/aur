# Maintainer: basigur

pkgname=neru-icon-classic-theme
pkgver=2.7
pkgrel=2
pkgdesc="Classic theme icons Neru"
arch=('any')
url="https://github.com/chistota/neru-icon-classic-theme"
license=('LGPL3')
depends=('gtk-update-icon-cache' 'librsvg' 'hicolor-icon-theme')
replaces=('neru-icon-classic-theme')
conflicts=()
source=("https://github.com/chistota/"${pkgname}"/archive/v"${pkgver}".tar.gz")
sha512sums=('5D3EF71C869DD6F63B010FE1E5BBA57018EA5310A7F707D7897319E5B2631C3D4BD12E4CFBCF77CD430CB6A887DFA41888C214EA26B29DD3A9E77991114B7A9B')


prepare() {
	cd "$srcdir"/"${pkgname}-${pkgver}"

	ln -s document-viewer.svg neru-classic-light/32x32/apps/graphics-viewer-document.svg
	ln -s document-viewer.svg neru-classic-light/32x32/apps/org.gnome.Evince.svg
	ln -s document-viewer.svg neru-classic-light/32x32/apps/xpdf9.svg
	ln -s document-viewer.svg neru-classic-light/32x32/apps/accessories-document-viewer.svg
	ln -s qv4l2.svg neru-classic-light/32x32/apps/qvidcap.svg
	ln -s usb-creator.svg neru-classic-light/32x32/apps/mintstick.svg

	ln -s filelight.svg neru-classic-light/32x32/apps/org.gnome.DiskUtility.svg
	ln -s ark.svg neru-classic-light/32x32/apps/org.gnome.ArchiveManager.svg
	ln -s preferences-system-privacy.svg neru-classic-light/32x32/apps/org.gnome.seahorse.Application.svg
	ln -s applications-fonts.svg neru-classic-light/32x32/apps/org.gnome.font-viewer.svg

	ln -s edit-find.svg neru-classic-light/32x32/apps/gtk-find.svg
	ln -s applications-multimedia.svg neru-classic-light/32x32/apps/gmtpicon.svg
	ln -s fontforge.svg neru-classic-light/32x32/apps/org.fontforge.FontForge.svg

	ln -s system-file-manager.svg neru-classic-light/32x32/apps/Insight-FileManager.svg
	ln -s system-file-manager.svg neru-classic-light/32x32/apps/WorkerIcon48.svg
	ln -s system-file-manager.svg neru-classic-light/32x32/apps/file-manager.svg
	ln -s system-file-manager.svg neru-classic-light/32x32/apps/filerunner.svg
	ln -s system-file-manager.svg neru-classic-light/32x32/apps/kfm.svg
	ln -s system-file-manager.svg neru-classic-light/32x32/apps/nautilus-actions-config-tool.svg
	ln -s system-file-manager.svg neru-classic-light/32x32/apps/redhat-filemanager.svg
	ln -s system-file-manager.svg neru-classic-light/32x32/apps/user-file-manager.svg


	gtk-update-icon-cache neru-classic-light/
	gtk-update-icon-cache neru-classic-dark/
	gtk-update-icon-cache neru-classic-light-green/
	gtk-update-icon-cache neru-classic-dark-green/
	gtk-update-icon-cache neru-classic-light-yellow/
	gtk-update-icon-cache neru-classic-dark-yellow/

	gtk-update-icon-cache neru-classic-light-gray/
	gtk-update-icon-cache neru-classic-dark-gray/
	gtk-update-icon-cache neru-classic-light-red/
	gtk-update-icon-cache neru-classic-dark-red/
}

package() {
	cd "$srcdir"/"${pkgname}-${pkgver}"

	install -d "$pkgdir/usr/share/icons"
	install -d "$pkgdir/usr/share/doc/${pkgname}"
	install -d "$pkgdir/usr/share/licenses/${pkgname}"

	cp -r neru-classic-* "$pkgdir"/usr/share/icons/


	cp -r LICENSE "$pkgdir"/usr/share/licenses/"${pkgname}"/
	cp -r {'README.md','AUTHORS','screenshot.svg','screenshot.png'} "$pkgdir"/usr/share/doc/"${pkgname}"/

}
