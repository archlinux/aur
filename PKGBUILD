# Maintainer: Gerard Salvatella <mail@gerardsalvatella.com>

pkgname=virtualhub
pkgver=56436
pkgrel=1
epoch=
pkgdesc="Toolbox for Yoctopuce USB devices"
arch=('x86_64')
url="https://www.yoctopuce.com"
license=('GPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=("yoctolib-cmdlines: cli binaries")
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=virtualhub.install
changelog=
source=("https://www.yoctopuce.com/FR/downloads/VirtualHub.linux.${pkgver}.zip"
       )
noextract=()
sha256sums=("SKIP"
           )
validpgpkeys=()

package() {
	install -d "${pkgdir}/usr/bin/" "${pkgdir}/usr/lib/systemd/system/" "${pkgdir}/etc/udev/rules.d/"
	install -Dm755 "64bits/VirtualHub" "${pkgdir}/usr/bin"
	install -Dm644 "startup_script/y${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/"
	install -Dm644 udev_conf/* "${pkgdir}/etc/udev/rules.d/"
}
