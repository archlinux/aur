# Maintainer: Alexander Kobel <a-kobel@a-kobel.de>

pkgname=rs-anewdsc
pkgver=20160205
pkgrel=2
pkgdesc="approximate arithmetic multi-precision real root isolator for univariate polynomials"
url="https://anewdsc.mpi-inf.mpg.de/"
arch=('x86_64')
license=('custom')
depends=('bash')
source=("${url}/test_descartes_linux64"
        'rs-anewdsc')
sha256sums=('b22b641ab8e8b99de66769c655afc9dad9919065001f285a46ff03e2a1c62cac'
            'dc23ad23437a02aafad397dd5db2dee1b0fb363eb1e12d832a451e5b573abb52')

package () {
  cd "${srcdir}"
  install -Dt "${pkgdir}/usr/bin" -m755 test_descartes_linux64 rs-anewdsc
  for wrapper in rs-classic rs-adsc rs-anewdsc-notrunc; do
    ln -s /usr/bin/rs-anewdsc "${pkgdir}/usr/bin/${wrapper}"
  done
}
