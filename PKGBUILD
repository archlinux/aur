# Maintainer: frodrigues <shello+aur -at- shello -dot- org>

pkgname=words-pt
pkgver=20220621
pkgrel=1
pkgdesc="A wordlist of Portuguese (pt-PT) words for /usr/share/dict/."
arch=("any")
url="https://natura.di.uminho.pt/wiki/doku.php?id=dicionarios:main"
license=("GPL-2.0-or-later" "LGPL-2.1-or-later" "MPL-1.1")
makedepends=('glibc')

source=(
    "wordlist-ao.txt.xz::https://natura.di.uminho.pt/download/sources/Dictionaries/wordlists/wordlist-ao-${pkgver}.txt.xz"
    "wordlist-preao.txt.xz::https://natura.di.uminho.pt/download/sources/Dictionaries/wordlists/wordlist-preao-${pkgver}.txt.xz"
)
sha256sums=(
    "25a4ff78a7b043127942b56f610cf9a0574453e5da9ac70f38f75e1e82461c5c"
    "998c1cb0140b2de064a75f154eac9d6d3ae5c2b16ce368b2ffe84b6663239c93"
)

build() {
    iconv --from-code=ISO-8859-1 --to-code=UTF-8 -o portuguese wordlist-ao.txt
    iconv --from-code=ISO-8859-1 --to-code=UTF-8 -o portuguese-preao wordlist-preao.txt
}

package() {
    install -Dm644 portuguese "$pkgdir/usr/share/dict/portuguese"
    install -Dm644 portuguese-preao "$pkgdir/usr/share/dict/portuguese-preao"
}
