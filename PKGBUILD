# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: trya <tryagainprod@gmail.com>

pkgname=quazip-legacy
_pkgname=quazip
pkgver=1.5
pkgrel=1
pkgdesc="Symlinks for legacy quazip layout by quazip-qt5"
url="https://stachenov.github.io/quazip/"
license=(LGPL)
arch=(x86_64)
depends=(quazip-qt5)

package() {
	mkdir -p "${pkgdir}"/usr/{include,lib/{cmake,pkgconfig}}
	ln -sv /usr/include/QuaZip-Qt5-1.5 "${pkgdir}"/usr/include/quazip5
	ln -sv /usr/lib/cmake/QuaZip-Qt5-1.5 "${pkgdir}"/usr/lib/cmake/QuaZip5
	ln -sv /usr/lib/pkgconfig/quazip1-qt5.pc "${pkgdir}"/usr/lib/pkgconfig/quazip.pc
	for e in so so.1 so.1.0.0 
		do ln -sv /usr/lib/libquazip1-qt5.so "${pkgdir}"/usr/lib/libquazip5.${e}
	done
}
