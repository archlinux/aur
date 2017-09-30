# Maintainer: Eric Toombs <ee double you toombs at you waterloo dot see eh?>

pkgname='stanza'
pkgver='0.11.7'
pkgrel=1
pkgdesc='The reference compiler for Stanza, a high-level multi-paradigm optionally typed programming language.'
arch=('x86_64')
groups=()
url='http://lbstanza.org/'
license=('GPL')

depends=(
)
makedepends=(
)
optdepends=(
)
provides=(
)
conflicts=(
)

_srcfile='lstanza_0_11_7.zip'
source=(
    "http://lbstanza.org/resources/stanza/$_srcfile"
)
noextract=("$_srcfile")
sha256sums=('87f59bf4ad42c76bee7b141fc860c79ee39890acbcf46effec58cb0a17350ffb')

install='install'

prepare() {
    if [[ -d "$pkgname" ]]; then
        rm -r "$pkgname"
    fi
    mkdir "$pkgname"
    cd "$pkgname"
    bsdtar xf "$srcdir/$_srcfile"
}

#build() {
#}

package() {
    mkdir "$pkgdir/opt"
    cp -pr "$srcdir/$pkgname" "$pkgdir/opt"

    mkdir -p "$pkgdir/usr/bin"
    ln -s "/opt/$pkgname/stanza" "$pkgdir/usr/bin/stanza"
}
