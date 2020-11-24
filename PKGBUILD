# Maintainer: Bart de Waal <bart@abnormail.org>
pkgname=words-nl
pkgver=r1.03ca894
pkgrel=1
pkgdesc="A wordlist of dutch words for /usr/share/dict/."
arch=('any')
url="https://github.com/OpenTaal/opentaal-wordlist"
license=(CCPL:by-sa)
makedepends=(git)
source=("git+https://github.com/OpenTaal/opentaal-wordlist.git#branch=master")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir"
    install -Dm644 opentaal-wordlist/wordlist.txt "$pkgdir/usr/share/dict/dutch"
}
