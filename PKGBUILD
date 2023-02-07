# Maintainer: Darjan Krijan [https://disc-kuraudo.eu]

pkgname=maqao-bin
pkgver=2.16.0
pkgrel=1
pkgdesc="MAQAO - Modular Assembly Quality Analyzer and Optimizer"
arch=('x86_64')
license=('LGPL3')
url="http://www.maqao.org"
source=("http://www.maqao.org/release/${pkgname%-bin}.intel64.${pkgver}.tar.xz")
conflicts=('maqao')
sha256sums=("377bfbd2dfcd8f791a41c38c72b65403c5bcdeb33a113350151123a90be504c2")

package() {
	prefix=${pkgdir}/usr
	mkdir -p ${prefix}/{bin,share/man/man1,share/licenses/maqao}

	cd ${srcdir}/${pkgname%-bin}.intel64.${pkgver}

	cp -p maqao.intel64 ${prefix}/bin
	cp -p man/* ${prefix}/share/man/man1
	cp -p LICENSE ${prefix}/share/licenses/maqao
}
