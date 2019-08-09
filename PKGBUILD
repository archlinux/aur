# Maintainer: Darjan Krijan (daren) <darjan_krijan@gmx.de>
# Manual download of 'AMDuProf_Linux_x64_${pkgver}.tar.bz2' required from upstream

pkgname=amduprof
pkgver=3.1.35
pkgrel=1
pkgdesc="AMD uProf is a performance analysis tool for applications running on Windows and Linux operating systems. It allows developers to better understand the runtime performance of their application and to identify ways to improve its performance."
arch=('x86_64')
license=('custom')
url="https://developer.amd.com/amd-uprof/"
source=("local://AMDuProf_Linux_x64_${pkgver}.tar.bz2")
options=('staticlibs' '!strip' 'libtool')
md5sums=("d5097d8066c0f6ecdc0f82f4c92dc591")

package() {
	mkdir -p ${pkgdir}/opt/amduprof
	cp -r ${srcdir}/AMDuProf_Linux_x64_${pkgver}/* ${pkgdir}/opt/amduprof

	mkdir -p ${pkgdir}/usr/bin
	ln -s /opt/amduprof/bin/AMDuProf ${pkgdir}/usr/bin/amduprof
	ln -s /opt/amduprof/bin/AMDuProfCLI ${pkgdir}/usr/bin/amduprof-cli
}
