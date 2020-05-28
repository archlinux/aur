# Maintainer: Maciej Dems <maciej.dems@p.lodz.pl>
pkgname=jama
pkgver=1.2.5
pkgrel=2
pkgdesc='C++ Linear Algebra Library based on TNT'
arch=(any)
url="http://math.nist.gov/tnt"
license=('custom')
source=('https://math.nist.gov/tnt/jama125.zip' 'tnt-include-fix.patch')
md5sums=('7a5acf6031cf35a6bb15a0fe1f70ed34'
         '1d31f1962c081181a26033575a313dfc')
depends=('tnt')

prepare() {
    cd ${srcdir}
    patch --forward --strip=1 --input="${srcdir}/tnt-include-fix.patch"
}

package() {
    cd ${srcdir}
    install -d ${pkgdir}/usr/include/${pkgname}
    install -m644 *.h ${pkgdir}/usr/include/${pkgname}	
}
