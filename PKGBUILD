pkgname=stegsnow
pkgver='20130616'
pkgrel=1
pkgdesc="The program SNOW is used to conceal messages in ASCII text by appending whitespace to the end of lines."
url="http://www.darkside.com.au/snow/"
license=('Apache 2.0')
arch=('any')
provides=('stegsnow')
source=(
    git+"https://anonscm.debian.org/git/collab-maint/stegsnow.git"
    "stegsnow.patch"
)
md5sums=(
    "SKIP"
    "3fc8c6e36aec935e1c5c2ff4ab428500"
)

build() {
    cd "$srcdir/stegsnow"
    git apply "../stegsnow.patch"
    make
}

package() {
    cd "$srcdir/stegsnow"
    install -D -m755 "stegsnow" "$pkgdir/usr/bin/stegsnow"
    install -D -m644 "stegsnow.1" "$pkgdir/usr/share/man/man1/stegsnow.1"
}
