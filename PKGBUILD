# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=bluraybackup-git
pkgver=1.0.r2.g6f2f38c
pkgrel=1
pkgdesc="command line program to backup Blu-ray Disc Movies (BDMV), inspired by dvdbackup"
arch=(x86_64)
url="https://git.golem.linux.it/matteobin/bluraybackup"
license=(GPL2)
depends=(libbluray)
makedepends=(git)
provides=(bluraybackup)
conflicts=(bluraybackup)
source=("git+https://git.golem.linux.it/matteobin/bluraybackup.git")
sha256sums=('SKIP')

pkgver() {
  cd bluraybackup
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd bluraybackup
  make
}

package() {
  cd bluraybackup
  make DESTDIR="${pkgdir}" PREFIX=/usr install
}
