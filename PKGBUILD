# Maintainer: Oliver Jaksch <arch-aur@com-in.de>

pkgname=hatari-enhanced-git
realpkgname=${pkgname%-*-*}
pkgver=2.3.0
pkgrel=1
pkgdesc='An Atari ST and STE emulator. This build uses capsimage for using IPF and STX disk images.'
arch=('x86_64')
url='http://hatari.sourceforge.net/'
license=('GPL')
depends=('sdl2' 'libpng' 'portaudio' 'systemd-libs' 'hicolor-icon-theme' 'capsimage')
makedepends=('cmake' 'systemd')
source=("https://download.tuxfamily.org/${realpkgname}/${pkgver}/${realpkgname}-${pkgver}.tar.bz2")
sha256sums=('bf48161903930f6470eca1d9c293f51b09b8c54695f5ee213af141316253b8a5')

build() {
  cd ${realpkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${realpkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
