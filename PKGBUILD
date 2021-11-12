# Maintainer: Viachaslau Khalikin <khalikin@yandex.by>
# Maintainer: Oliver Jaksch <arch-aur@com-in.de>

_pkgbase=libretro-opera
pkgname=${_pkgbase}-git
pkgver=r456.d8aa7ce
pkgrel=1
pkgdesc="libretro implementation of 4DO/libfreedo (3DO)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/opera-libretro"
license=('GPL3')
groups=('libretro')
depends=(
  glibc
  libretro-core-info
)
makedepends=(
  git
)
source=("$_pkgbase::git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgbase}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  make -C "${_pkgbase}"
}

package() {
  install -Dm 644 "${_pkgbase}"/opera_libretro.so -t "${pkgdir}"/usr/lib/libretro/
}

# vim:set ft=sh ts=2 sw=2 et:

