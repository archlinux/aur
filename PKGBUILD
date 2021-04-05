# Maintainer: desbma
pkgname=gmsl
pkgver=1.1.9
pkgrel=1
pkgdesc='GNU Make Standard Library: extra functions to extend functionality of Makefiles'
arch=('any')
url="http://${pkgname}.sourceforge.net/"
license=('BSD')
depends=('make')
source=("http://downloads.sourceforge.net/project/${pkgname}/GNU%20Make%20Standard%20Library/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        'LICENSE')
sha512sums=('bdd3ad83ac367891a58002b2c0b3e8f725203732a3c2d7b507ab2d4860c7f60e442a34766664ac290c027c78c62343f087196b48220de3ca6ba0158cd1697413'
            '64b041044df4e99526261852ce2ba14dcfc6192025de629776a7fb10510c0a38aaa1f536a0045fbc316285b8b8f16a5dc6210110ddcb4f34762a9862140d6594')

check() {
    cd "${pkgname}-${pkgver}"
    make -f gmsl-tests
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm 644 -t "${pkgdir}/usr/include" gmsl __gmsl
    install -Dm 644 -t "${pkgdir}/usr/share/doc/${pkgname}" index.html README
    install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/LICENSE"
}
