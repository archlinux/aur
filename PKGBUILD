# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: oliver at first.in-berlin.de
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Mildred <silkensedai@online.fr>
# Contributor: hpmachining <aur at hpminc dot com>

pkgname=omake
pkgver=0.10.7
pkgrel=1
pkgdesc="A build system designed for scalability and portability"
arch=(x86_64)
url="https://github.com/ocaml-omake/omake"
license=(GPL-2.0-only)
depends=(glibc ncurses readline)
makedepends=(ocaml)
source=("https://github.com/ocaml-omake/omake/archive/refs/tags/omake-${pkgver}.tar.gz")
sha256sums=('ec098107429a419965feab5cee5dfa2996fc3fdc23842d910c314590941cafb8')

build() {
  cd "omake-omake-${pkgver}"
  ./configure -prefix=/usr
    #--mandir=/usr/share/man
  make all
}

package() {
  cd "omake-omake-${pkgver}"
  make INSTALL_ROOT="$pkgdir" install
  mkdir -vp "$pkgdir"/usr/share/
  mv -v "$pkgdir"/usr/man "$pkgdir"/usr/share/
}
