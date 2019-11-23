# Maintainer: basigur
# Origin: Sadrlimanov Ramil Rashitovich

pkgname=neru-icon-classic-theme
pkgver=2.7
pkgrel=5
pkgdesc="Classic theme icons Neru"
arch=('any')
url="https://github.com/chistota/neru-icon-classic-theme"
license=('LGPL3')
depends=('gtk-update-icon-cache')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/chistota/"${pkgname}"/archive/v"${pkgver}".tar.gz"
         'neru-2.7.patch')
sha256sums=('f03e19d145cc7582933ac2c89cfccfd73e2a63f776fab0838629d7b98dcebfb2'
            '9e7218102d2569847c6c46944426a9a855e320be02b55493c53ca95861f9023b')


prepare() {
	cd "${pkgname}-${pkgver}"
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
	ln -s utilities-terminal.svg neru-classic-light/32x32/apps/org.gnome.Terminal.svg
	
	ln -s preferences-desktop-color.svg neru-classic-light/32x32/apps/xfce4-color-settings.svg
	ln -s wps-office-wpsmain.svg neru-classic-light/32x32/apps/wps-office2019-wpsmain.svg
	ln -s wps-office-wppmain.svg neru-classic-light/32x32/apps/wps-office2019-wppmain.svg
	ln -s preferences-desktop-color.svg neru-classic-light/32x32/apps/package_graphics.svg
	ln -s electron.svg neru-classic-light/32x32/apps/electron4.svg
	ln -s wps-office-wpsmain.svg neru-classic-light/32x32/apps/com.wps.Office2019.wpsmain.svg
	ln -s wps-office-wppmain.svg neru-classic-light/32x32/apps/com.wps.Office2019.wppmain.svg
	ln -s wps-office-wpsmain.svg neru-classic-light/32x32/apps/com.wps.Office.wpsmain.svg
	ln -s wps-office-wppmain.svg neru-classic-light/32x32/apps/com.wps.Office.wppmain.svg
	ln -s wps-office-etmain.svg neru-classic-light/32x32/apps/wps-office2019-etmain.svg
	ln -sf preferences-desktop-multimedia.svg neru-classic-light/32x32/apps/redhat-sound_video.svg
	
	#ln -s wps-office-pdfmain.svg neru-classic-light/32x32/apps/wps-office2019-pdfmain.svg
	#ln -s wps-office-pdfmain.svg neru-classic-light/32x32/apps/com.wps.Office2019.pdfmain.svg
	#ln -s wps-office-pdfmain.svg neru-classic-light/32x32/apps/com.wps.Office.pdfmain.svg
	#ln -s edit-find.svg neru-classic-light/32x32/apps/gtk-find.svg
	
	rm -f neru-classic-light/32x32/apps/pick-colour-picker.svg
	rm -f neru-classic-light/32x32/apps/xfce-system.svg
	
	patch -Np1 -i "${srcdir}"/neru-2.7.patch
}


package() {
    cd "${pkgname}-${pkgver}"
    install -d "$pkgdir/usr/share/icons"
    cp -r */ "$pkgdir"/usr/share/icons/
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md AUTHORS screenshot.svg -t "${pkgdir}/usr/share/doc/${pkgname}/"
}

