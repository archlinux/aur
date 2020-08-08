# Maintainer: Mike Cuche <cuche@gmx.com>
pkgname=keepassxc-wordlist-italian
pkgver=4
pkgrel=1
pkgdesc="Italian diceware wordlist for keepassxc"
arch=('any')
url="https://www.taringamberini.com/it/diceware_it_IT/lista-di-parole-diceware-in-italiano/"
license=('GPL')
depends=('keepassxc>=2.2.0')
source=(
    "https://www.taringamberini.com/downloads/diceware_it_IT/lista-di-parole-diceware-in-italiano/4/word_list_diceware_it-IT-4.txt"
    )
sha256sums=(
    "b441559b64fb7041b9bbcecb3c43111f2523ec84e172670409f40c462eda0b93"
    )

prepare() {
    tail -n +18 word_list_diceware_it-IT-4.txt |
	head -n 7776 |
	sed 's/^[1-6]\+[ \t]\+\([^ \t]\+\).*$/\1/' > $srcdir/diceware-it-v4.wordlist
}

package() {
    install -Dm644 $srcdir/diceware-it-v4.wordlist \
	$pkgdir/usr/share/keepassxc/wordlists/diceware-it-v4.wordlist
}
