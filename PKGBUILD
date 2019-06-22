# Maintainer: basigur
# Origin: Sadrlimanov Ramil Rashitovich

pkgname=neru-icon-classic-theme
pkgver=2.7
pkgrel=4
pkgdesc="Classic theme icons Neru"
arch=('any')
url="https://github.com/chistota/neru-icon-classic-theme"
license=('LGPL3')
depends=('gtk-update-icon-cache')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/chistota/"${pkgname}"/archive/v"${pkgver}".tar.gz")

md5sums=('265525887608c3358a792de266954d0e')
sha1sums=('33328744c5e5a2e02ec9e67743098693eafc7f75')
sha256sums=('f03e19d145cc7582933ac2c89cfccfd73e2a63f776fab0838629d7b98dcebfb2')
sha512sums=('5d3ef71c869dd6f63b010fe1e5bba57018ea5310a7f707d7897319e5b2631c3d4bd12e4cfbcf77cd430cb6a887dfa41888c214ea26b29dd3a9e77991114b7a9b')


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
	ln -s utilities-terminal.svg neru-classic-light/32x32/apps/org.gnome.Terminal.svg
}

package() {
	cd "$srcdir"/"${pkgname}-${pkgver}"

	install -d "$pkgdir/usr/share/icons"
	cp -r neru-classic-* "$pkgdir"/usr/share/icons/

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    local _res
    for _res in README.md AUTHORS screenshot.svg screenshot.png
    do
	install -Dm644 "${_res}" "${pkgdir}/usr/share/doc/${pkgname}/${_res}"
    done
}

