# Maintainer: pezcurrel <pezcurrel [at] insicuri.net>
# Contributor: Piotr Beling <qwak [at] stud.ics.p.lodz.pl>

pkgname=blockout2-bin
pkgver=2.5
pkgrel=3
pkgdesc='3D tetris, free adaptation of the original BlockOut DOS game edited by California Dreams in 1989. Pre-compiled.'
arch=('x86_64')
url='http://www.blockout.net/blockout2/'
depends=('sh' 'glibc' 'gcc-libs' 'libglvnd' 'glu' 'sdl12-compat' 'sdl_mixer')
conflicts=('blockout2')
license=('GPL-2.0-or-later')
source=('http://downloads.sourceforge.net/project/blockout/blockout/BlockOut%202.5/bl25-linux-x64.tar.gz' 'blockout2' 'blockout2.desktop' 'blockout2.png')
md5sums=('6155d0596d762852e3fbd1718d3d6455' '130e2c10b68b41bf12e67a764a2ea4fb' 'c3d7d196e4af7fabd287376988376fe4' '166642ab949cd145f6126857a5ac7e4f')

package() {
	install -d "${pkgdir}"/{opt,usr/bin,usr/share/applications,usr/share/pixmaps}
	chmod -x "${srcdir}/blockout/README.txt" "${srcdir}/blockout/images/background.png" "${srcdir}/blockout/sounds/music.ogg"
	mv "${srcdir}/blockout" "${pkgdir}/opt/blockout2"
	cp "${srcdir}/blockout2" "${pkgdir}/usr/bin/"
	cp "blockout2.desktop" "${pkgdir}/usr/share/applications/"
	cp "blockout2.png" "${pkgdir}/usr/share/pixmaps/"
}
