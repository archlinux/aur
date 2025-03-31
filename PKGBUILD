# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=gmsl
pkgver=1.2.4
pkgrel=1
pkgdesc='GNU Make Standard Library: extra functions to extend functionality of Makefiles'
arch=('any')
url="https://${pkgname}.jgc.org/"
license=('BSD')
depends=('make')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jgrahamc/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('3e4e6dceb884c3f36de6ff6dc2f52810782c9eb382128d2fb29168270e24e305e268bfaedc2c5ef39f3cc697b2d4a7abba02013aa0ef24aceb5352b3a10fc5b5')

check() {
    cd "${pkgname}-${pkgver}"
    make test
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm 644 -t "${pkgdir}/usr/include" gmsl __gmsl
    install -Dm 644 -t "${pkgdir}/usr/share/doc/${pkgname}" index.html README changelog.md
    install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
