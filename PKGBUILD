# Maintainer: Diogo Correia <diogo.t.correia at tecnico dot ulisboa dot pt>
pkgname=po-uilib
pkgver=202508310000
pkgrel=1
pkgdesc="A UI library for the PO course at IST university"
url="https://web.tecnico.ulisboa.pt/~david.matos/w/pt/index.php/Programa%C3%A7%C3%A3o_com_Objectos"
license=('CCPL')
arch=(any)
_pkgname=Po-uilib
_pkgpath=6/6f
source=("https://web.tecnico.ulisboa.pt/~david.matos/w/pt/images/$_pkgpath/$_pkgname-$pkgver.tar.bz2")
sha256sums=("41dcdc98a7e3a5d9020ebc5c40a326693a5c894806db17b905bb6d47c2c4aa00")
depends=('java-environment')

prepare() {
	# Fix incorrect inner dir name...
	mv "$srcdir/$pkgname-202408310000" "$srcdir/$pkgname-$pkgver"
}

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

