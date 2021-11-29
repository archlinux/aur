# Maintainer: ipochto <ipochto@gmail.com>

pkgname=war1gus
pkgver=3.1.2
pkgrel=1
pkgdesc="Warcraft1 Mod that allows you to play Warcraft1 with the Stratagus engine"
arch=("i686" "x86_64")
url="https://github.com/Wargus/war1gus"
license=('GPL')
depends=("stratagus=$pkgver" 'ffmpeg' 'innoextract')
makedepends=('cmake' 'imagemagick')
source=("https://github.com/Wargus/$pkgname/archive/v${pkgver}.tar.gz")
md5sums=('3b0cad05b8b7be117426ab8d1f58bfb5')
provides=(${pkgname})
conflicts=('war1gus-git')

build() {
  cd ${srcdir}

  cmake "${pkgname}-${pkgver}" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DGAMEDIR=/usr/bin -Bbuild

  make -C build
}

package()  {
  cd $srcdir/build
  make  DESTDIR=${pkgdir} install
}
