# Maintainer: Griever <coprgriever at gmail dot com>
# Contributor: Chris Simpson <csimpson.aur at gmail dot com>

pkgname=libretro-mednafen-pce-fast-git
pkgver=716.1503dee
pkgrel=1
pkgdesc='PC Engine core'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/libretro/beetle-pce-fast-libretro'
license=('GPL2')
groups=('libretro')
depends=('gcc-libs' 'glibc')
makedepends=('git')
source=('libretro-mednafen-pce-fast::git+https://github.com/libretro/beetle-pce-fast-libretro.git'
'https://raw.githubusercontent.com/libretro/libretro-super/master/dist/info/mednafen_pce_fast_libretro.info')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd libretro-mednafen-pce-fast

  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd libretro-mednafen-pce-fast

  make
}

package() {
  cd libretro-mednafen-pce-fast

  install -dm 755 "${pkgdir}"/usr/{lib/libretro,share/libretro/info}
  install -m 644 mednafen_pce_fast_libretro.so "${pkgdir}"/usr/lib/libretro/
  install -m 644 ../mednafen_pce_fast_libretro.info "${pkgdir}"/usr/share/libretro/info/
}
