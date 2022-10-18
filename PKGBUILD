# Maintainer: skysphr <skysphr at protonmail dot com>

pkgname=hunspell-ka
pkgver=0.1
pkgrel=1
pkgdesc="Georgian hunspell dictionary"
arch=(any)
url="https://github.com/gamag/ka_GE.spell"
license=('MIT')
optdepends=('hunspell: the spell checking libraries and apps')
source=(
    'https://raw.githubusercontent.com/gamag/ka_GE.spell/b2f437ccbfaa6369444237ac0ace0c303ef2b487/dictionaries/ka_GE.aff'
    'https://raw.githubusercontent.com/gamag/ka_GE.spell/26d33614360c3784c199e3a6766eb5b095a134b8/dictionaries/ka_GE.dic'
)
b2sums=(
    'f69b91aebeb474e10f094b5c330f44979b4d28bce405ff42bb88a1fcc82cca9afb732217eac82ff623f70d5d578b31a90fdb74f5cbb62cca406935d8770c0b9c'
    'c59bdf1bcd767c5b1237581e6b4f540dec0bbfe707778ae33969122c7916ed12bf7995309715b8823f5420a512b47e4c86113e705ef1babbe57038f74a4392bf'
)

package() {
    install -Dm644 ka_GE.aff "$pkgdir/usr/share/hunspell/ka_GE.aff"
    install -Dm644 ka_GE.dic "$pkgdir/usr/share/hunspell/ka_GE.dic"

    install -dm755 "$pkgdir/usr/share/myspell/dicts"
    ln -s "$pkgdir/usr/share/hunspell/ka_GE.aff" "$pkgdir/usr/share/myspell/dicts"
    ln -s "$pkgdir/usr/share/hunspell/ka_GE.dic" "$pkgdir/usr/share/myspell/dicts"
}

