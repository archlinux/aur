# Maintainer: MCMic <come@chilliet.eu>
# Contributor: MCMic <come@chilliet.eu>
# Contributor: Sam101 <zoetrem @t gmail dot com>
# Contributor: BenObiWan <benobiwan @t gmail dot com>
# Contributor: Huulivoide
# Contributor: Fernando Carmona Varo <ferkiwi @t gmail dot com>

pkgname=solarus
pkgver=1.6.2
pkgrel=1
epoch=
pkgdesc="A lightweight, free and open-source game engine for Action-RPGs"
arch=('i686' 'x86_64')
url="http://www.solarus-games.org/"
license=('GPL')
groups=()
depends=('luajit' 'sdl2_image' 'sdl2_ttf' 'physfs' 'openal' 'libvorbis' 'libmodplug' 'qt5-tools' 'qt5-base' 'libglvnd')
makedepends=('cmake')
checkdepends=()
optdepends=('zsxd' 'zsdx' 'zelda-roth-se')
provides=('solarus-engine')
conflicts=('zsdxdemo-en' 'zsdxdemo-de' 'zsdxdemo-fr' 'solarus-git')
replaces=('zsdxdemo-en' 'zsdxdemo-de' 'zsdxdemo-fr' 'solarus-git')
backup=()
options=()
install=
changelog=
source=("https://gitlab.com/solarus-games/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
noextract=()
md5sums=('f5ea8ccddb3d26136b5de51e255e991f')

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"

  cmake -D CMAKE_INSTALL_PREFIX="/usr" -D CMAKE_BUILD_TYPE=Release -D DEFAULT_QUEST=/usr/share/solarus/zsdx .
  make
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  make DESTDIR="${pkgdir}/" PREFIX="/usr" install
}

