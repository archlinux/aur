# Maintainer: BenObiWan <benobiwan @t gmail dot com>
# Contributor: Sam101 <zoetrem @t gmail dot com>
# Contributor: BenObiWan <benobiwan @t gmail dot com>
# Contributor: Huulivoide
# Contributor: Fernando Carmona Varo <ferkiwi @t gmail dot com>
pkgname=solarus
pkgver=1.6.0
pkgrel=1
epoch=
pkgdesc="An open-source Zelda-like 2D game engine used by the games zsxd and zsdx."
arch=('i686' 'x86_64')
url="http://www.solarus-games.org/"
license=('GPL')
groups=()
depends=('luajit' 'sdl2_image' 'sdl2_ttf' 'physfs' 'openal' 'libvorbis' 'libmodplug' 'qt5-tools' 'qt5-base' 'libglvnd')
makedepends=('cmake' 'zip')
checkdepends=()
optdepends=('zsxd' 'zsdx' 'zelda-roth-se')
provides=('solarus-engine')
conflicts=('zsdxdemo-en' 'zsdxdemo-de' 'zsdxdemo-fr' 'solarus-git')
replaces=('zsdxdemo-en' 'zsdxdemo-de' 'zsdxdemo-fr' 'solarus-git')
backup=()
options=()
install=
changelog=
source=(http://solarus-games.org/downloads/$pkgname/$pkgname-$pkgver-src.tar.gz)
noextract=()
md5sums=('c7d81c934109520cac39b9c9e434059d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  cmake -D CMAKE_INSTALL_PREFIX="/usr" -D CMAKE_BUILD_TYPE=Release -D DEFAULT_QUEST=/usr/share/solarus/zsdx .
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" PREFIX="/usr" install
}

