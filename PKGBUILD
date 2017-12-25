# Maintainer: Rafał Frączek <rafalfr@protonmail.ch>
pkgname=smarttrafficmeter
pkgver=2.1.1227.6875
pkgrel=1
pkgdesc="Software for measuring network usage."
arch=('x86_64')
url="https://github.com/rafalfr/smarttrafficmeter"
license=('GPL3')
depends=('boost-libs' 'curl')
makedepends=('gcc' 'git' 'boost' 'curl' 'binutils')
checkdepends=()
optdepends=()
provides=('smarttrafficmeter')
conflicts=()
replaces=()
backup=()
options=()
install='smarttrafficmeter.install'
changelog=
source=()
noextract=()
md5sums=()
validpgpkeys=()

build() {
	git clone --depth 1 "https://github.com/rafalfr/smarttrafficmeter.git"
	cd ${srcdir}/smarttrafficmeter/
	make -f SmartTrafficMeter.cbp.mak linux_release
}

package() {
 	install -D -m755 ${srcdir}/smarttrafficmeter/bin/Release/smarttrafficmeter ${pkgdir}/usr/bin/smarttrafficmeter
 	install -D -m755 ${srcdir}/smarttrafficmeter/install/smarttrafficmeter.service ${pkgdir}/usr/lib/systemd/system/smarttrafficmeter.service
 }
