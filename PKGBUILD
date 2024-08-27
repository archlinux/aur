# Maintainer: Sterophonick
pkgname=heartlib
_pkgname='heartlib'
pkgver=1.00
pkgrel=2
pkgdesc='Comprehensive API for Nintendo GBA inspired by HAMLib and HELlib'
url='https://github.com/Sterophonick/HeartLib'
arch=(x86_64 i686 aarch64)
makedepends=(base-devel)
depends=(devkitARM devkitARM-gdb maxmod-gba gba-examples devkitpro-keyring) # these can only be acquired if devkitpro is installed lol
source=(git+https://github.com/Sterophonick/HeartLib)
md5sums=('SKIP')
license=('gplv3')
options=(!strip)

package() {
  mkdir -p $pkgdir/opt/devkitpro/libheart/include
  mkdir -p $pkgdir/opt/devkitpro/libheart/lib
  mkdir -p $pkgdir/opt/devkitpro/examples

  cd HeartLib
  mkdir -p build
  make

  cp libheart.a $pkgdir/opt/devkitpro/libheart/lib
  cp LICENSE $pkgdir/opt/devkitpro/libheart
  cp APLIB-LICENSE $pkgdir/opt/devkitpro/libheart
  cp GBFS-LICENSE $pkgdir/opt/devkitpro/libheart
  cp LIBGBA-LICENSE $pkgdir/opt/devkitpro/libheart
  cp RUMBLE-LICENSE $pkgdir/opt/devkitpro/libheart
  cp include/* $pkgdir/opt/devkitpro/libheart/include

  cp -r samples $pkgdir/opt/devkitpro/examples/libheart-samples
}
