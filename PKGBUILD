# Maintainer: Darjan Krijan [https://disc-kuraudo.eu]

pkgname=maqao-bin
pkgver=2.17.0
pkgrel=1
pkgdesc="MAQAO - Modular Assembly Quality Analyzer and Optimizer"
arch=('x86_64')
license=('LGPL3')
url="http://www.maqao.org"
source=("http://www.maqao.org/maqao_archive/${pkgname%-bin}.intel64.${pkgver}.tar.xz")
conflicts=('maqao')
sha256sums=("cdfd752e072ceb934505e495a6fd00ef60c1fe2da34b7fdef65c2590f01acf0a")

package() {
	prefix=${pkgdir}/usr
	mkdir -p ${prefix}/{bin,share/man/man1,share/licenses/maqao}

	cd ${srcdir}/${pkgname%-bin}.intel64.${pkgver}

	cp -p maqao.intel64 ${prefix}/bin
	cp -p man/* ${prefix}/share/man/man1
	cp -p LICENSE ${prefix}/share/licenses/maqao
}
