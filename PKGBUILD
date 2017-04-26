# Maintainer: Aleksandr Boyko <brdcom@yandex.ru>
pkgname=texlive-irmologion
pkgver=1.0
pkgrel=2
pkgdesc="TeX Live - Additional fonts from the site irmologion.ru to typeset Church Slavonic text"
arch=('any')
url="http://irmologion.ru"
license=('unknown')
makedepends=("unrar")
source=("${url}/fonts/slavucs8_t1.rar"
        "${url}/fonts/psalucs8_t1.rar"
        "${url}/fonts/zlatucs8_t1.rar")
noextract=("psalucs8_t1.rar"
           "slavucs8_t1.rar"
           "zlatucs8_t1.rar")

prepare () {
    unrar x psalucs8_t1.rar
    unrar x slavucs8_t1.rar
    unrar x zlatucs8_t1.rar
}

package() {
    install -dm755 "$pkgdir/usr/local/share/texmf/fonts/type1/csltex"
    install -Dm644 "$srcdir/PsalUcs.pfb" "$pkgdir/usr/local/share/texmf/fonts/type1/csltex/PsalUcs.pfb"
    install -Dm644 "$srcdir/SlavUcs.pfb" "$pkgdir/usr/local/share/texmf/fonts/type1/csltex/SlavUcs.pfb"
    install -Dm644 "$srcdir/ZlatUcs.pfb" "$pkgdir/usr/local/share/texmf/fonts/type1/csltex/ZlatUcs.pfb"
}

md5sums=('b0139708a9bdf6fe31d591e4079d91e2'
         '24d0df891b96592f45278cfc7a320fe6'
         '2e1b85eb791fd986c99e556890c3caae')
