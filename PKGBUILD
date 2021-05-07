# XJump
# Maintainer: Sterophonick

# THIS IS A FORK OF THE XBILL PACKAGE MAINTAINED BY THE FOLLOWING PEOPLE
# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=xjump
pkgver=2.7.5
pkgrel=1
pkgdesc="A game where you jump up and up while the tower collapses under your feet."
arch=('x86_64' 'i686')
url="https://github.com/hugomg/xjump"
license=('GPL')
depends=('xaw3d' 'libxpm')
makedepends=('libxaw')
source=(http://archive.ubuntu.com/ubuntu/pool/universe/x/xjump/xjump_2.7.5.orig.tar.gz)
md5sums=('3e8d09c6b8162b7e4380f8a77eb595dc')

build() {
  cd xjump-2.7.5.orig
  make clean
  make
}

package() {
	mkdir "${pkgdir}/usr"
	mkdir "${pkgdir}/usr/bin"
	mkdir "${pkgdir}/usr/share"
	mkdir "${pkgdir}/usr/share/pixmaps"
	mkdir "${pkgdir}/usr/share/applications"
	install -g games -c -s -m 2755 xjump-2.7.5.orig/xjump "${pkgdir}/usr/bin"
	cp xjump-2.7.5.orig/xjump-icon.xpm "${pkgdir}/usr/share/pixmaps"
	printf "[Desktop Entry]\nVersion=1.0\nEncoding=UTF-8\nType=Application\nName=XJump\nComment=A jumping game\nComment[fr]=Un jeu de saut\nTryExec=xjump\nExec=xjump\nIcon=xjump-icon.xpm\nCategories=Application;Game;" >> "${pkgdir}/usr/share/applications/xjump.desktop"
}

