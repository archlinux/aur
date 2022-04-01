# Maintainer: Gerard Ribugent Navarro <ribugent@gmail.com>
pkgname=keepassxc-wordlist-catalan
pkgver=0.20170609
pkgrel=1
pkgdesc="Catalan diceware wordlists for keepassxc password generation"
arch=(any)
url="https://github.com/1ma/diceware-cat"
license=('CCPL')
source=("https://raw.githubusercontent.com/1ma/diceware-cat/ba71c1d5238cdff371e70d995d2a6f82c46122b9/cat-wordlist-utf8.txt"
        "https://raw.githubusercontent.com/1ma/diceware-cat/ba71c1d5238cdff371e70d995d2a6f82c46122b9/cat-wordlist-ascii.txt")
noextract=()
sha512sums=("906b99151b1a407749c9fd3b32020eab8810e89442289aa145c092cf5b79739bd59da085addc850a2d1f0d0999451a52dae9bc18fae95c0b3849f43c5bf3faea" "84011d9d00cfa78bf48e65990792151e5dff9972622ac9c084a02026dc6f66f42a52b866ddc161a24a3d4345f048cf7e048e674688426c57c6c9657c30229f5d")

prepare() {
	egrep '^[[:digit:]]+[[:blank:]]+' $srcdir/cat-wordlist-utf8.txt > $srcdir/catala.wordlist
	egrep '^[[:digit:]]+[[:blank:]]+' $srcdir/cat-wordlist-ascii.txt > $srcdir/catala-ascii.wordlist
}

package() {
    install -Dm644 $srcdir/catala.wordlist $pkgdir/usr/share/keepassxc/wordlists/catala.wordlist
    install -Dm644 $srcdir/catala-ascii.wordlist $pkgdir/usr/share/keepassxc/wordlists/catala-ascii.wordlist
}
