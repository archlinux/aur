# Contributor: Thaodan <theodorstormgrade@gmail.com>

pkgname=wargus
pkgver=3.1.2
pkgrel=1
pkgdesc="Warcraft2 Mod that allows you to play Warcraft2 with the Stratagus engine"
arch=("i686" "x86_64")
url="https://github.com/WARGUS/WARGUS"
license=('GPL')
depends=( "stratagus=$pkgver" 'ffmpeg2theora' 'cdparanoia' 'timidity++' 'gtk2' 'tolua++' )
makedepends=('cmake')
source=("https://github.com/Wargus/$pkgname/archive/v${pkgver}.tar.gz")
md5sums=('1dcf2b4b45c56223cf7538dba174cd92')
install=wargus.install

prepare()
{
  mkdir -p build
}
build() {
  cd build
  cmake "$srcdir"/"$pkgname-$pkgver" \
	-DCMAKE_INSTALL_PREFIX=/usr \
        -DGAMEDIR=/usr/bin
  make 
}

package()  {
  cd build
  make  DESTDIR=${pkgdir} install
}

