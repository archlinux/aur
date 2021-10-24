# Maintainer: Diogo Correia <diogo.t.correia at tecnico dot ulisboa dot pt>
pkgname=po-uilib
pkgver=202110212142
pkgrel=1
pkgdesc="A UI library for the PO course at IST university"
url="https://web.tecnico.ulisboa.pt/~david.matos/w/pt/index.php/Programa%C3%A7%C3%A3o_com_Objectos"
license=('CCPL')
arch=('x86_64')
_pkgname=Po-uilib
_pkgpath=6/67
source=("https://web.tecnico.ulisboa.pt/~david.matos/w/pt/images/$_pkgpath/$_pkgname-$pkgver.tar.bz2")
sha256sums=("25c3f084c93a3f620fc05a14080ca8feb5cf6f8af47496e86d73d11b37ae4ab3")
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

