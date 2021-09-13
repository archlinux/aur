# Maintainer: Viachaslau Khalikin <khalikin@yandex.by>
# Maintainer: Oliver Jaksch <arch-aur at com-in dot de>
# Contributor: Mike Polvere <mic.tjs@gmail.com>
# Contributor: Johnathan Jenkins <twodopeshaggy@gmail.com>
# Contributor: prettyvanilla <prettyvanilla@posteo.at>
# Contributor: almostalive <almostalive2003 at gmail dot com>

_pkgbase=libretro-fceumm
pkgname=${_pkgbase}-git
pkgver=r1144.afe2b4d
pkgrel=1
pkgdesc="libretro implementation of FCEUmm. (Nintendo Entertainment System)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/libretro-fceumm"
license=('GPL2')
groups=('libretro')
depends=(
  glibc
  libretro-core-info
)
makedepends=(
  git
)
source=("$_pkgbase::git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd "${_pkgbase}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  make -C "${_pkgbase}"
}

package() {
  install -Dm 644 "${_pkgbase}"/fceumm_libretro.so -t "${pkgdir}"/usr/lib/libretro/
}

# vim:set ft=sh ts=2 sw=2 et:
