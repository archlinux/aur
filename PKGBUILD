# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duettools
pkgver=1.0.1.0
pkgrel=1
pkgdesc="Optional tools (code examples)"
arch=('armv7h')
url="https://github.com/chrishamm/DuetSoftwareFramework"
license=('GPL3')
provides=('duettools')
conflicts=('duettools')
depends=('duetcontrolserver')
options=(!strip staticlibs)
source=('https://chrishamm.io/debian/dists/stretch/dsf/binary-armhf/duettools_1.0.1.0.deb')
sha256sums=('55886d6ce86ef0d45f765ba45ba1bf98d48fa7256acc7eba6c1b4d922ada48aa')

prepare() {
    tar -xf data.tar.xz
}

package() {

	# DuetControlServer, DuetWebServer, CodeConsole, CodeLogger
	install -dm 755 "${pkgdir}"/{opt/dsf/bin,opt/dsf/conf,usr/bin}
	install "${srcdir}/opt/dsf/bin/"* "${pkgdir}/opt/dsf/bin"

	ln -s "/opt/dsf/bin/CodeConsole" "${pkgdir}/usr/bin/"
	ln -s "/opt/dsf/bin/CodeLogger" "${pkgdir}/usr/bin/"
}
