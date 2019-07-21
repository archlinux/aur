# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duettools
pkgver=1.0.2.1
pkgrel=1
pkgdesc="Optional tools (code examples)"
arch=('armv7h')
url="https://github.com/chrishamm/DuetSoftwareFramework"
license=('GPL3')
provides=('duettools')
conflicts=('duettools')
depends=('duetcontrolserver=1.0.2.1')
options=(!strip staticlibs)
source=("https://chrishamm.io/debian/dists/stretch/dsf/binary-armhf/duettools_${pkgver}.deb")
sha256sums=('b8c43435f13fb9db5157f7dbabb687ae69003b3f857402f5e14b0b1194e8e435')

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
