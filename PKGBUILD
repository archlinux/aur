# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=bluraybackup
pkgver=2.0
pkgrel=1
pkgdesc="command line program to backup Blu-ray Disc Movies (BDMV), inspired by dvdbackup"
arch=(x86_64)
url="https://git.golem.linux.it/matteobin/bluraybackup"
license=(GPL-3.0-or-later)
depends=(glibc libbluray libaacs)
optdepends=(libbdplus)
source=("${pkgname}-${pkgver}.tar.gz::https://git.golem.linux.it/matteobin/bluraybackup/archive/${pkgver}.tar.gz")
sha256sums=('31837b390d1d5851bef68de1f7fa6d1deb6fe9045045e50fac94da04919dd42e')

build() {
  cd bluraybackup
  make
}

package() {
  cd bluraybackup
  make DESTDIR="${pkgdir}" PREFIX=/usr install
}
