# Maintainer: BenObiWan <benobiwan @t gmail dot com>
# Contributor: Sam101 <zoetrem @t gmail dot com>
# Contributor: BenObiWan <benobiwan @t gmail dot com>
# Contributor: Huulivoide
# Contributor: Fernando Carmona Varo <ferkiwi @t gmail dot com>
pkgname=solarus
pkgver=1.5.1
pkgrel=1
epoch=
pkgdesc="An open-source Zelda-like 2D game engine used by the games zsxd and zsdx."
arch=('i686' 'x86_64')
url="http://www.solarus-engine.org/"
license=('GPL')
groups=()
depends=('luajit' 'sdl2_image' 'sdl2_ttf' 'physfs' 'openal' 'libvorbis' 'libmodplug' 'qt5-tools' 'qt5-base')
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
source=(http://www.zelda-solarus.com/downloads/$pkgname/$pkgname-$pkgver-src.tar.gz)
noextract=()
md5sums=('647a5908e33721febf3b7dce1dbd9c39')


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  cmake -D CMAKE_INSTALL_PREFIX="/usr" -D CMAKE_BUILD_TYPE=Release -D DEFAULT_QUEST=/usr/share/solarus/zsdx .
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" PREFIX="/usr" install
}

