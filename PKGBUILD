# Maintainer: Diogo Correia <diogo.t.correia at tecnico dot ulisboa dot pt>
pkgname=po-uilib
pkgver=202109221024
pkgrel=1
pkgdesc="A UI library for the PO course at IST university"
url="https://web.tecnico.ulisboa.pt/~david.matos/w/pt/index.php/Programa%C3%A7%C3%A3o_com_Objectos"
license=('CCPL')
arch=('x86_64')
_pkgname=Po-uilib
source=("https://web.tecnico.ulisboa.pt/~david.matos/w/pt/images/3/37/$_pkgname-$pkgver.tar.bz2")
sha256sums=("94b1b559b2f7b393163481fce0c4146cf7e0094a142ee6f66672e6404c2d544d")
depends=('java-environment')

build() {
        cd "$srcdir/$pkgname-$pkgver"

        make
}

package() {
        cd "$srcdir/"

        mkdir -p "${pkgdir}/usr/lib"
        cp -r "${pkgname}-${pkgver}" "${pkgdir}/usr/lib"
        mv "${pkgdir}/usr/lib/${pkgname}-${pkgver}" "${pkgdir}/usr/lib/${pkgname}"
}

