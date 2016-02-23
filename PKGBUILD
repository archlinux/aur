# Maintainer: Jason Scurtu (scujas) <jscurtu@gmail.com>

pkgname=room-arranger
pkgver=8.3.1
pkgrel=1
pkgdesc="Room Arranger is 3D room / apartment / floor planner with simple user interface. Once you get the basics, you can draw whatever you imagine. While having wide library of objects, you can easily create your own piece of furniture."
arch=('x86_64')
license=('custom')
provides=('room-arranger')
conflicts=('room-arranger')
url='http://www.roomarranger.com'
source=("https://s3.eu-central-1.amazonaws.com/rooarr/rooarr831-linux64.tar.gz" 
	"rooarr_run.sh"
	"roomarranger.desktop")

sha256sums=('9bcee305ea7d3e66d8292f7ce27c83c623f01c8327d2a567684f7dc4d18ca611' 
	'7c56e76c411df0967175d3248d16209fe1caa2523273376df50ea7915093c489'
	'207ea379d3cdddc1fdb06261a02155c7306c859a530fef23a3e6ed92c367cb99')

package() {
	ICON_DIR="${pkgdir}/usr/share/icons/hicolor"
	DESKTOP_DIR="${pkgdir}/usr/share/applications"
	MIME_DIR="${pkgdir}/usr/share/mime"
	MIME_ASSOC_FILE="${pkgdir}/usr/share/applications/mimeapps.list"

	mkdir -p "${pkgdir}/opt/"
	mkdir -p $ICON_DIR/16x16/apps
	mkdir -p $ICON_DIR/32x32/apps
	mkdir -p $ICON_DIR/48x48/apps
	mkdir -p $ICON_DIR/64x64/apps
	mkdir -p $ICON_DIR/128x128/apps
	mkdir -p $ICON_DIR/256x256/apps
	mkdir -p $ICON_DIR/512x512/apps
	mkdir -p $ICON_DIR/32x32/mimetypes
	mkdir -p $DESKTOP_DIR
	mkdir -p "${pkgdir}/usr/bin"

	cp -r  "${srcdir}/rooarr-setup/rooarr-bin"  "${pkgdir}/opt/"

	install "${srcdir}/rooarr-setup/rooarr-bin/icons/icon_16x16.png"  "$ICON_DIR/16x16/apps/roomarranger-icon.png"
	install "${srcdir}/rooarr-setup/rooarr-bin/icons/icon_32x32.png" "$ICON_DIR/32x32/apps/roomarranger-icon.png"
	install "${srcdir}/rooarr-setup/rooarr-bin/icons/icon_48x48.png" "$ICON_DIR/48x48/apps/roomarranger-icon.png"
	install "${srcdir}/rooarr-setup/rooarr-bin/icons/icon_64x64.png" "$ICON_DIR/64x64/apps/roomarranger-icon.png"
	install "${srcdir}/rooarr-setup/rooarr-bin/icons/icon_128x128.png" "$ICON_DIR/128x128/apps/roomarranger-icon.png"
	install "${srcdir}/rooarr-setup/rooarr-bin/icons/icon_256x256.png" "$ICON_DIR/256x256/apps/roomarranger-icon.png"
	install "${srcdir}/rooarr-setup/rooarr-bin/icons/icon_512x512.png" "$ICON_DIR/512x512/apps/roomarranger-icon.png"
	install "${srcdir}/roomarranger.desktop" "$DESKTOP_DIR/roomarranger.desktop"
	install "${srcdir}/rooarr_run.sh" "${pkgdir}/usr/bin/rooarr_run.sh"
	install "${srcdir}/rooarr-setup/rooarr-bin/icons/raFileIcon32.png" "$ICON_DIR/32x32/mimetypes/application-com.roomarranger.project.png"
	install "${srcdir}/rooarr-setup/rooarr-bin/icons/raFileObjectIcon32.png" "$ICON_DIR/32x32/mimetypes/application-com.roomarranger.object.png"

	chmod +x "${pkgdir}/usr/bin/rooarr_run.sh"
}

#makepkg --geninteg >> PKGBUILD


