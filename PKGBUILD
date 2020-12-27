# Maintainer: Oliver Jaksch <arch-aur@com-in.de>

pkgname=hatari-enhanced-git
realpkgname=${pkgname%-*-*}
pkgver=2.3.1
pkgrel=1
pkgdesc='An Atari ST and STE emulator. This build uses capsimage for using IPF and STX disk images.'
arch=('x86_64')
url='http://hatari.sourceforge.net/'
license=('GPL')
depends=('sdl2' 'libpng' 'portaudio' 'systemd-libs' 'hicolor-icon-theme' 'capsimage')
makedepends=('cmake' 'systemd')
conflicts=('hatari')
source=("https://download.tuxfamily.org/${realpkgname}/${pkgver}/${realpkgname}-${pkgver}.tar.bz2")
sha256sums=('44a2f62ca995e38d9e0874806956f0b9c3cc84ea89e0169a63849b63cd3b64bd')

build() {
  cd ${realpkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${realpkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
