# Maintainer: mfussenegger
# Contributor: Jan Holthuis <holthuis dot jan at googlemail dot com>
pkgname=libretro-pocketsnes-git
pkgver=r17.79f6be5
pkgrel=1
pkgdesc="ARM based SNES emulator for libretro"
arch=('arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/pocketsnes-libretro"
license=('custom')
makedepends=('git')
conflicts=('libretro-super-git')
 
_gitname="pocketsnes-libretro"
source=("git+https://github.com/libretro/${_gitname}.git")
sha1sums=('SKIP')
 
pkgver() {
cd "$srcdir/${_gitname}"
printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
 
build()
{
cd "$srcdir/${_gitname}"
make
}
 
package()
{
mkdir -p "$pkgdir/usr/lib/libretro"
install -m755 "$srcdir/${_gitname}/libretro.so" "$pkgdir/usr/lib/libretro/libretro-pocketsnes.so"
} 
