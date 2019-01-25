# Maintainer: desbma
pkgname=gmsl
pkgver=1.1.8
pkgrel=1
pkgdesc='GNU Make Standard Library: extra functions to extend functionality of Makefiles'
arch=('any')
url="http://${pkgname}.sourceforge.net/"
license=('BSD')
depends=('make')
source=("http://downloads.sourceforge.net/project/${pkgname}/GNU%20Make%20Standard%20Library/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        'LICENSE')
sha512sums=('8b7fbb37407164abf92e745d6909ef496dbf28ab31599f40f0fc6a3368437d2a9daad435e467eb0deb5b32f90d9273c924e7e84a27b03bb9f5234c42f52439af'
            '64b041044df4e99526261852ce2ba14dcfc6192025de629776a7fb10510c0a38aaa1f536a0045fbc316285b8b8f16a5dc6210110ddcb4f34762a9862140d6594')

check() {
    make -f gmsl-tests
}

package() {
    install -Dm 644 -t "${pkgdir}/usr/include" gmsl __gmsl
    install -Dm 644 -t "${pkgdir}/usr/share/doc/${pkgname}" index.html README
    cd "${srcdir}"
    install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
