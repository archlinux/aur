# Contributor: Jozef Riha <jose1711 at gmail dot com>

pkgname=deadspace
pkgver=1
pkgrel=3
pkgdesc="a utility that prohibits mouse from entering dead space when screen spans over multiple monitors"
url="http://www.abclinuxu.cz/blog/Joseho_blog/2009/9/najde-sa-niekto-na-napisanie-patchu"
license=("custom:beerware")
depends=('libx11')
arch=('i686')
source=("http://eeg.cz/=forro=/dead_space.tar.gz" "new_xorg.patch")
md5sums=('bf60dd4bb85b834ca701705f0b30f553'
         'ea73283dba6472683d79c8c8281fd4f6')

build() {
  cd dead_space
  patch < ../new_xorg.patch dead_space.c
  make || return 1
  install -D -m755 dead_space ${pkgdir}/usr/bin/dead_space
}
