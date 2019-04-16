# Maintainer: basigur

pkgname=neru-icon-newyear-theme
pkgver=1.0
pkgrel=5
pkgdesc="Christmas theme icons Neru"
arch=('any')
url="https://github.com/chistota/neru-icon-newyear-theme/"
license=('LGPL3')
depends=('gtk-update-icon-cache' 'librsvg' 'hicolor-icon-theme')
replaces=(neru-icon-newyear-theme)
conflicts=()
source=("https://github.com/chistota/"${pkgname}"/archive/v"${pkgver}".tar.gz")
sha512sums=('bccacbdd05de2ee4fd50c6bd842c8266ccae3fc120d624aae7bbdebd9b3f5ac7ca8bb123a34d085a5c35d5e141d62eb79a55a2c052d39d5f84a0a3bf1f2833a8')


prepare() {
	cd "$srcdir"/"${pkgname}-${pkgver}"
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

	ln -s filelight.svg neru-newyear-light/medium/apps/org.gnome.DiskUtility.svg
	ln -s ark.svg neru-newyear-light/medium/apps/org.gnome.ArchiveManager.svg
	ln -s preferences-system-privacy.svg neru-newyear-light/medium/apps/org.gnome.seahorse.Application.svg
	ln -s applications-fonts.svg neru-newyear-light/medium/apps/org.gnome.font-viewer.svg
	ln -s edit-find.svg neru-newyear-light/medium/apps/gtk-find.svg
	ln -s applications-multimedia.svg neru-newyear-light/medium/apps/gmtpicon.svg
	ln -s fontforge.svg neru-newyear-light/medium/apps/org.fontforge.FontForge.svg


	ln -s filelight.svg neru-newyear-dark/medium/apps/org.gnome.DiskUtility.svg
	ln -s ark.svg neru-newyear-dark/medium/apps/org.gnome.ArchiveManager.svg
	ln -s preferences-system-privacy.svg neru-newyear-dark/medium/apps/org.gnome.seahorse.Application.svg
	ln -s applications-fonts.svg neru-newyear-dark/medium/apps/org.gnome.font-viewer.svg
	ln -s edit-find.svg neru-newyear-dark/medium/apps/gtk-find.svg
	ln -s applications-multimedia.svg neru-newyear-dark/medium/apps/gmtpicon.svg
	ln -s fontforge.svg neru-newyear-dark/medium/apps/org.fontforge.FontForge.svg


	ln -s system-file-manager.svg neru-newyear-light/medium/apps/Insight-FileManager.svg
	ln -s system-file-manager.svg neru-newyear-light/medium/apps/WorkerIcon48.svg
	ln -s system-file-manager.svg neru-newyear-light/medium/apps/file-manager.svg
	ln -s system-file-manager.svg neru-newyear-light/medium/apps/filerunner.svg
	ln -s system-file-manager.svg neru-newyear-light/medium/apps/kfm.svg
	ln -s system-file-manager.svg neru-newyear-light/medium/apps/nautilus-actions-config-tool.svg
	ln -s system-file-manager.svg neru-newyear-light/medium/apps/redhat-filemanager.svg
	ln -s system-file-manager.svg neru-newyear-light/medium/apps/user-file-manager.svg


	ln -s system-file-manager.svg neru-newyear-dark/medium/apps/Insight-FileManager.svg
	ln -s system-file-manager.svg neru-newyear-dark/medium/apps/WorkerIcon48.svg
	ln -s system-file-manager.svg neru-newyear-dark/medium/apps/file-manager.svg
	ln -s system-file-manager.svg neru-newyear-dark/medium/apps/filerunner.svg
	ln -s system-file-manager.svg neru-newyear-dark/medium/apps/kfm.svg
	ln -s system-file-manager.svg neru-newyear-dark/medium/apps/nautilus-actions-config-tool.svg
	ln -s system-file-manager.svg neru-newyear-dark/medium/apps/redhat-filemanager.svg
	ln -s system-file-manager.svg neru-newyear-dark/medium/apps/user-file-manager.svg


	gtk-update-icon-cache neru-newyear-light
	gtk-update-icon-cache neru-newyear-dark

}

package() {
	cd "$srcdir"/"${pkgname}-${pkgver}"
	install -d "$pkgdir/usr/share/icons"
	install -d "$pkgdir/usr/share/doc/${pkgname}"
	install -d "$pkgdir/usr/share/licenses/${pkgname}"

	cp -r {'neru-newyear-dark','neru-newyear-light'} "$pkgdir"/usr/share/icons/

	cp -r LICENSE "$pkgdir"/usr/share/licenses/"${pkgname}"/
	cp -r {README.md,AUTHORS,screenshot.svg} "$pkgdir"/usr/share/doc/"${pkgname}"/
}
