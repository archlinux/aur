# Maintainer: Darjan Krijan [https://disc-kuraudo.eu]

pkgname=maqao-bin
pkgver=2.17.0
pkgrel=2
pkgdesc="MAQAO - Modular Assembly Quality Analyzer and Optimizer"
arch=('x86_64' 'aarch64')
license=('LGPL3')
url="http://www.maqao.org"
source=("http://www.maqao.org/maqao_archive/${pkgname%-bin}.${CARCH/x86_64/intel64}.${pkgver}.tar.xz")
eonflicts=('maqao')
[ ${CARCH} == "x86_64"  ] && sha256sums=('cdfd752e072ceb934505e495a6fd00ef60c1fe2da34b7fdef65c2590f01acf0a')
[ ${CARCH} == "aarch64" ] && sha256sums=('a1516377f1058dbe0bdd6ed9ac355a7a47dfe58a9c2671fd46520d26d73379bb')

package() {
	prefix=${pkgdir}/usr
	mkdir -p ${prefix}/{bin,share/man/man1,share/licenses/maqao}

	cd ${srcdir}/${pkgname%-bin}.${CARCH/x86_64/intel64}.${pkgver}

	cp -p maqao.${CARCH/x86_64/intel64} ${prefix}/bin
	cp -p man/* ${prefix}/share/man/man1
	cp -p LICENSE ${prefix}/share/licenses/maqao
}
