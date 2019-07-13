# Maintainer: Darjan Krijan (daren) <darjan_krijan@gmx.de>
# Manual download of 'AMDuProf_Linux_x64_${pkgver}.tar.bz2' required from upstream

pkgname=amduprof
pkgver=3.0.281
pkgrel=1
pkgdesc="AMD uProf is a performance analysis tool for applications running on Windows and Linux operating systems. It allows developers to better understand the runtime performance of their application and to identify ways to improve its performance."
arch=('x86_64')
license=('custom')
url="https://developer.amd.com/amd-uprof/"
source=("file://AMDuProf_Linux_x64_${pkgver}.tar.bz2")
options=('staticlibs' '!strip' 'libtool')
sha256sums=("9a5d3800ebd0c184ab5faed463bd31567eb72d475973c0698946db2e0e817e2b")

package() {
	mkdir -p ${pkgdir}/opt/amduprof
	cp -r ${srcdir}/AMDuProf_Linux_x64_${pkgver}/* ${pkgdir}/opt/amduprof

	mkdir -p ${pkgdir}/usr/bin
	ln -s /opt/amduprof/bin/AMDuProf ${pkgdir}/usr/bin/amduprof
	ln -s /opt/amduprof/bin/AMDuProfCLI ${pkgdir}/usr/bin/amduprof-cli
}
