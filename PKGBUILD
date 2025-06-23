# Maintainer: Darjan Krijan [https://disc-kuraudo.eu]

pkgname=maqao-bin
pkgver=2025.1.0
pkgrel=1
pkgdesc="MAQAO - Modular Assembly Quality Analyzer and Optimizer"
arch=('x86_64' 'aarch64')
license=('LGPL3')
url="http://www.maqao.org"
source=("http://www.maqao.org/maqao_archive/${pkgname%-bin}.${CARCH}.${pkgver}.tar.xz")
eonflicts=('maqao')
[ ${CARCH} == "x86_64"  ] && sha256sums=('e28f4c3ad8f15aaf455b46d6c46f6451fa8aef51ffee134bb766f98570941c8c')
[ ${CARCH} == "aarch64" ] && sha256sums=('993d610a3625c7ff605233a388981d87a2f42741a900c29e5de1e47ae69e5b67')

package() {
	prefix=${pkgdir}/usr
	mkdir -p ${prefix}/{bin,share/man/man1,share/licenses/maqao}

	cd ${srcdir}/${pkgname%-bin}.${CARCH}.${pkgver}

	cp -p bin/maqao ${prefix}/bin
	cp -r man/man1/* ${prefix}/share/man/man1
	cp -p LICENSE ${prefix}/share/licenses/maqao
}
