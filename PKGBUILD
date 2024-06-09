# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=bluraybackup
pkgver=1.0
pkgrel=1
pkgdesc="command line program to backup Blu-ray Disc Movies (BDMV), inspired by dvdbackup"
arch=(x86_64)
url="https://git.golem.linux.it/matteobin/bluraybackup"
license=(GPL2)
depends=(glibc libbluray)
source=("${pkgname}-${pkgver}.tar.gz::https://git.golem.linux.it/matteobin/bluraybackup/archive/${pkgver}.tar.gz")
sha256sums=('91e65f66b0799cc4a96810824458941053adb89ec84adc2b569c00a482ff3724')

build() {
  cd bluraybackup
  make
}

package() {
  cd bluraybackup
  make DESTDIR="${pkgdir}" PREFIX=/usr install
}
