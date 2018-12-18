# Maintainer: Rafał Frączek <rafalfr@protonmail.ch>
pkgname=smarttrafficmeter
pkgver=2.1.1298.7254
pkgrel=1
pkgdesc="Software for measuring network usage."
arch=('x86_64')
url="https://github.com/rafalfr/smarttrafficmeter"
license=('GPL3')
depends=('boost-libs' 'curl' 'xdg-utils')
makedepends=('gcc' 'git' 'boost' 'curl' 'binutils' 'gzip')
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
    install -D -m755 ${srcdir}/smarttrafficmeter/bin/release/smarttrafficmeter ${pkgdir}/usr/bin/smarttrafficmeter
    install -D -m755 ${srcdir}/smarttrafficmeter/install/arch/smarttrafficmeter.service ${pkgdir}/usr/lib/systemd/system/smarttrafficmeter.service
    install -D -m755 ${srcdir}/smarttrafficmeter/man/smarttrafficmeter.1 ${pkgdir}/usr/share/man/man1/smarttrafficmeter.1
    install -D -m755 ${srcdir}/smarttrafficmeter/install/desktop/smarttrafficmeter.desktop ${pkgdir}/usr/share/applications/smarttrafficmeter.desktop
    install -D -m755 ${srcdir}/smarttrafficmeter/install/desktop/smarttrafficmeter.png ${pkgdir}/usr/share/pixmaps/smarttrafficmeter.png
    install -D -m755 ${srcdir}/smarttrafficmeter/install/desktop/smarttrafficmeter.appdata.xml ${pkgdir}/usr/share/appdata/smarttrafficmeter.appdata.xml
}
