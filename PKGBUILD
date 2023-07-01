# Maintainer: Nixuge

pkgname=appimage-builder-bin
_pkgname=appimage-builder
pkgver=1.1.1
pkgrel=1
pkgdesc='GNU/Linux packaging solution using the AppImage format'
url=https://github.com/AppImageCrafters/appimage-builder
arch=(x86_64)
license=(MIT)
conflicts=('appimage-builder')
provides=('appimage-builder')
depends=("binutils" "desktop-file-utils" "fakeroot" "gdk-pixbuf2" "patchelf" "python-pip" "python-setuptools" "squashfs-tools" "strace" "wget" "zsync")
options=(!strip)
install='appimage-builder.install'
_tag="Continuous"
_appimage="appimage-builder-1.1.1.dev32+g2709a3b-x86_64.AppImage"
_desktop="org.appimage-crafters.appimage-builder.desktop"
source=("https://github.com/AppImageCrafters/appimage-builder/releases/download/${_tag}/${_appimage}")
sha256sums=('7569b710262a42de0d577ece8bfd0b917e9fdbd4a8d0437c29c635b0eaddd7bf')


package() {
	# AppImage
	install -Dm755 \
		"${srcdir}/${_appimage}" \
		"${pkgdir}/opt/${_pkgname}/${_pkgname}.AppImage"


	# Symlink executable
	install -dm755 "${pkgdir}/usr/bin"
	ln -s \
		"/opt/${_pkgname}/${_pkgname}.AppImage" \
		"${pkgdir}/usr/bin/${_pkgname}"
}
