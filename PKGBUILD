# Maintainer: oliver at first.in-berlin.de
# Former Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Mildred <silkensedai@online.fr>
# Contributor: hpmachining <aur at hpminc dot com>

pkgname=omake
pkgver=0.10.3
pkgrel=2
pkgdesc="A build system designed for scalability and portability"
arch=('x86_64')
url="http://projects.camlcity.org/projects/omake.html"
license=('GPL2')
makedepends=('ocaml')
source=(http://download.camlcity.org/download/omake-$pkgver.tar.gz)
sha256sums=('ff3107e9459615ea6526309c533b04815eef60692a20dcd3a6169f5860786d1d')

build() {
  cd "$pkgname-$pkgver"
  ./configure -prefix=/usr
  make all
}

package() {
  cd "$pkgname-$pkgver"
  make INSTALL_ROOT="$pkgdir" install
}
