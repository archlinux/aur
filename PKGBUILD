# Maintainer: Michele Bovo <mbovo@gmx.com>
pkgname=keepassxc-wordlist-italian
pkgver=3
pkgrel=1
pkgdesc="Italian diceware wordlist for keepassxc"
arch=('any')
url="https://www.taringamberini.com/it/diceware_it_IT/lista-di-parole-diceware-in-italiano/"
license=('GPL')
depends=('keepassxc>=2.2.0')
source=(
    "https://www.taringamberini.com/downloads/diceware_it_IT/lista-di-parole-diceware-in-italiano/3/word_list_diceware_it-IT-3.txt"
    )
sha256sums=(
    "16c33bf4ba32ccd2918ca5155e6876ec0359a92f196095ec5756df65e0688ca6"
    )

prepare() {
    tail -n +18 word_list_diceware_it-IT-3.txt |
	head -n 7776 |
	sed 's/^[1-6]\+[ \t]\+\([^ \t]\+\).*$/\1/' > $srcdir/diceware-it-v3.wordlist
}

package() {
    install -Dm644 $srcdir/diceware-it-v3.wordlist \
	$pkgdir/usr/share/keepassxc/wordlists/diceware-it-v3.wordlist
}
