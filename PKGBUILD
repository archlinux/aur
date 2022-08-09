#Contributor: Oliver Jaksch <arch-aur@com-in.de>
# Maintainer:  John "Beelzebud" Bilbrey <beelzebud> at Geemail dot com

pkgname=hatari-enhanced-git
realpkgname=hatari
pkgver=v2.4.1.0.g4371dcd6
pkgrel=1
pkgdesc='An Atari ST and STE emulator. This build uses capsimage for using IPF and STX disk images.'
arch=('x86_64')
url='http://hatari.sourceforge.net/'
license=('GPL')
depends=('sdl2' 'libpng' 'portaudio' 'systemd-libs' 'hicolor-icon-theme' 'capsimage')
makedepends=('cmake' 'git' 'systemd')
conflicts=('hatari')
source=("git://git.tuxfamily.org/gitroot/hatari/hatari.git")
sha256sums=('SKIP')

pkgver() {
	cd "$realpkgname"
	git describe --long | sed "s/\([^-]*-g\) /r\1/;s/-/./g"
}

build() {
  cd ${realpkgname}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${realpkgname}
  make DESTDIR="${pkgdir}" install
}
