# Maintainer: frodrigues <shello+aur -at- shello -dot- org>

pkgname=words-pt
pkgver=20251001
pkgrel=2
pkgdesc="A wordlist of Portuguese (pt-PT) words for /usr/share/dict/."
arch=("any")
url="https://natura.di.uminho.pt/wiki/doku.php?id=dicionarios:main"
license=("GPL-2.0-or-later" "LGPL-2.1-or-later" "MPL-1.1")
makedepends=('glibc')

source=(
    "wordlist-ao-${pkgver}.txt.xz::https://natura.di.uminho.pt/download/sources/Dictionaries/wordlists/wordlist-ao-${pkgver}.txt.xz"
    "wordlist-preao-${pkgver}.txt.xz::https://natura.di.uminho.pt/download/sources/Dictionaries/wordlists/wordlist-preao-${pkgver}.txt.xz"
)
sha256sums=(
    "ac5fb0cd0359d6b4678dc3d93e3311e008367a23f187f893f8b37662dfec0344"
    "aadc31a7c33315be84316f8235ed808f39d01c5a5a05c29e91e2da5a698c9f72"
)

build() {
    iconv --from-code=ISO-8859-1 --to-code=UTF-8 -o portuguese "wordlist-ao-${pkgver}.txt"
    iconv --from-code=ISO-8859-1 --to-code=UTF-8 -o portuguese-preao "wordlist-preao-${pkgver}.txt"
}

package() {
    install -Dm644 portuguese "$pkgdir/usr/share/dict/portuguese"
    install -Dm644 portuguese-preao "$pkgdir/usr/share/dict/portuguese-preao"
}
