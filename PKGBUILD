# Maintainer: Kisuke-CZE <kisuke@kisuke.cz>
pkgname=melody-music-player-git
_pkgname=playmymusic
pkgver=0.0.1
pkgrel=1
pkgdesc="Music Player and Manager for local Music Files made for ElementaryOS"
arch=('x86_64')
url="http://anufrij.org/melody/"
license=('LGPL 2.1+')
depends=('vala' 'appstream')
makedepends=('git' 'meson' 'gcc')
provides=('melody-music-player-git')
source=("git+https://github.com/artemanufrij/playmymusic.git")
md5sums=('SKIP')

build() {
  cd ${srcdir}/${_pkgname}
  # meson build --prefix="${pkgdir}"
  meson build --prefix=/usr
}

package() {
  cd "${srcdir}/${_pkgname}/build"
  env DESTDIR="${pkgdir}" ninja install
}
