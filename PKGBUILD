# Maintainer: desbma
pkgname=gmsl
pkgver=1.1.7
pkgrel=1
pkgdesc="GNU Make Standard Library: extra functions to extend functionality of Makefiles"
arch=('any')
url="http://gmsl.sourceforge.net/"
license=('BSD')
depends=('make')
source=(http://downloads.sourceforge.net/project/${pkgname}/GNU%20Make%20Standard%20Library/v${pkgver}/${pkgname}-${pkgver}.tar.gz
        'LICENSE')
md5sums=('cc1b1a758a1d2567583f1c7f68368a07'
         '13d815e33b3231faeb6ead3d1c2e41d6')

check() {
    cd "${pkgname}-${pkgver}"
    make -f gmsl-tests
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm 644 -t "${pkgdir}/usr/include" gmsl __gmsl
    install -Dm 644 -t "${pkgdir}/usr/share/doc/${pkgname}" index.html README
    cd "${srcdir}"
    install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
