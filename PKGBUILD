# Maintainer: basxto <archlinux basxto de>

pkgname=mtsedit-git
pkgdesc="Simple editor for MineTest Schematic files"
pkgver=64.19444bc
pkgrel=1
arch=(x86_64)
url="https://gitlab.com/bztsrc/mtsedit"
license=(MIT)
provides=(mtsedit)
makedepends=(git)
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
	mkdir -p "${pkgdir}/usr/bin" "${pkgdir}/usr/share/mtsedit" "${pkgdir}/usr/share/applications" "${pkgdir}/usr/share/icons/hicolor/32x32/apps"  "${pkgdir}/usr/share/licenses/mtsedit-git"
	make -C mtsedit/src DESTDIR="${pkgdir}/" install
	cp mtsedit/LICENSE "${pkgdir}/usr/share/licenses/mtsedit-git"
	chown root:root "${pkgdir}/usr/bin/mtsedit"
}
