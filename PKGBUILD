# Author:  Stunts <f.pinamartins@gmail.com>

pkgname=concatenator
pkgver=1.1.0
pkgrel=2
pkgdesc="Genetic data matrix converter and concatenator"
arch=(any)
license=('GPL3')
depends=('perl' 'tk')
url="http://cobig2.com"
source=(https://github.com/StuntsPT/${pkgname}/archive/${pkgver}.tar.gz)
md5sums=('092c17b31481c16a84d2260670668724')

package() {
  install -d ${pkgdir}/usr/bin
  install -d ${pkgdir}/usr/share/doc/concatenator
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i 's/VH.dat/\/usr\/share\/doc\/concatenator\/VH.dat/g' Concatenator.pl
  sed -i 's/Concatenator.dat/\/usr\/share\/doc\/concatenator\/Concatenator.dat/g' Concatenator.pl
  sed -i 's/FNF.dat/\/usr\/share\/doc\/concatenator\/FNF.dat/g' Concatenator.pl
  install -D -m 755 Concatenator.pl ${pkgdir}/usr/bin/concatenator
  install -D -m 644 license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
  install -D *.dat ${pkgdir}/usr/share/doc/concatenator
}
