# Maintainer: basxto <archlinux basxto de>

pkgname=mtsedit-git
pkgdesc="Simple editor for MineTest Schematic files"
pkgver=62.fe8d9dd
pkgrel=1
arch=(x86_64)
url="https://gitlab.com/bztsrc/mtsedit"
license=(MIT)
provides=(mtsedit)
depends=(sdl2 hicolor-icon-theme)
source=(git+https://gitlab.com/bztsrc/mtsedit.git/)
sha1sums=('SKIP')

pkgver(){
	cd mtsedit
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build(){
	make -C mtsedit/src
}

package(){
	cd mtsedit
	mkdir -p "${pkgdir}/usr/local/bin" "${pkgdir}/usr/local/share/mtsedit" "${pkgdir}/usr/local/share/applications" "${pkgdir}/usr/local/share/icons/hicolor/32x32/apps"
	install -m 755 src/mtsedit "${pkgdir}/usr/local/bin" 
	cp -r data/* "${pkgdir}/usr/local/share/mtsedit" 
	cp etc/mtsedit.desktop "${pkgdir}/usr/local/share/applications"
	cp etc/mtsedit.png "${pkgdir}/usr/local/share/icons/hicolor/32x32/apps"
}
