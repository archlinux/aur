# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duettools
pkgver=1.0.3.1
pkgrel=1
pkgdesc="Optional tools (code examples)"
arch=('armv7h')
url="https://github.com/chrishamm/DuetSoftwareFramework"
license=('GPL3')
provides=('duettools')
conflicts=('duettools')
depends=("duetcontrolserver>=${pkgver}")
options=(!strip staticlibs)
source=("https://chrishamm.io/debian/dists/buster/dsf/binary-armhf/duettools_${pkgver}.deb")
sha256sums=('5c927eda24b1d99c157086fc20fa34a7ba4cd482a96339dd81cba5d9bddf8605')

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
