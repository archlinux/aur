# Maintainer: Zeta Gabriels <zetagabriels@gmail.com>
pkgname=userspace-tablet-driver-daemon
pkgver=0.1.3
pkgrel=1
epoch=
pkgdesc="A userspace daemon for XP-Pen and Huion tablets - stable version."
arch=("x86_64")
url="https://github.com/kurikaesu/userspace-tablet-driver-daemon.git"
license=('GPL3')
groups=()
depends=()
makedepends=(git cmake make)
checkdepends=()
optdepends=()
provides=(userspace_tablet_driver_daemon)
conflicts=(userspace-tablet-driver-daemon-git)
replaces=()
backup=()
options=()
install=ustdd.install
changelog=
source=(https://github.com/kurikaesu/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz)
noextract=()
md5sums=()
validpgpkeys=()
sha256sums=('SKIP')


build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	cmake .
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	sudo udevadm trigger
}
