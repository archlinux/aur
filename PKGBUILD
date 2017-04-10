# Maintainer: desbma
pkgname=gmsl
pkgver=1.1.7
pkgrel=2
pkgdesc="GNU Make Standard Library: extra functions to extend functionality of Makefiles"
arch=('any')
url="http://gmsl.sourceforge.net/"
license=('BSD')
depends=('make')
source=(http://downloads.sourceforge.net/project/${pkgname}/GNU%20Make%20Standard%20Library/v${pkgver}/${pkgname}-${pkgver}.tar.gz
        'LICENSE')
sha512sums=('4ae3251653047abfdc2f64c965d175d26542f0f224005e155a14d01f5d12298c847d4d6d490c118faa14ccaef8b88c66e16fcf92159bef4dfd999e1f8f97b50e'
            '64b041044df4e99526261852ce2ba14dcfc6192025de629776a7fb10510c0a38aaa1f536a0045fbc316285b8b8f16a5dc6210110ddcb4f34762a9862140d6594')

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
