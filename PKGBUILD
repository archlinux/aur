# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duettools
pkgver=1.0.3.2
pkgrel=1
pkgdesc="Optional tools (code examples)"
arch=('armv7h')
url="https://github.com/chrishamm/DuetSoftwareFramework"
license=('GPL3')
provides=('duettools')
conflicts=('duettools')
depends=("duetcontrolserver>=${pkgver}")
options=(!strip staticlibs)
source=("https://pkg.duet3d.com/dists/unstable/armv7/binary-armhf/duettools_${pkgver}.deb")
sha256sums=('6a5d0cb2677f13b384f81590550354ef617d2756ce75f8743b16bcb8988049e1')

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
