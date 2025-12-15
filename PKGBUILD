# Maintainer: Ryan Smith <ryan.smith.p287@gmail.com>

pkgname=(imfit-bin)
pkgver=1.9.0
pkgrel=2
pkgdesc="Fast, Flexible Multi-component Fitting of Galaxy Images"
url="https://www.mpe.mpg.de/~erwin/code/imfit/"
arch=('x86_64')
license=('GPL-3.0' 'Custom')
depends=()
makedepends=()
conflicts=()
replaces=()
source=(https://www.mpe.mpg.de/~erwin/resources/imfit/binaries/imfit-${pkgver}-linux-64.tar.gz)
sha256sums=('9eb10a62baab87de98744c247f7a10ea02b05d32996760b7cef100f5f02a7089')
options=(!debug)

package() {
    cd ${srcdir}
    install -Dm755 imfit-${pkgver}/imfit ${pkgdir}/usr/bin/imfit
    install -Dm755 imfit-${pkgver}/imfit-mcmc ${pkgdir}/usr/bin/imfit-mcmc
    install -Dm755 imfit-${pkgver}/makeimage ${pkgdir}/usr/bin/makeimage

    mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}/
    cp -t ${pkgdir}/usr/share/licenses/${pkgname}/ imfit-${pkgver}/COPYING.txt imfit-${pkgver}/DISCLAIMER
}
