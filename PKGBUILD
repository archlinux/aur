# Maintainer: Simon Lemay <contact+archlinux@simonlemay.net>
# Contributor: Jim Pryor <profjim@jimpryor.net>

pkgname=chicken-numbers
_pkgname=numbers
pkgver=4.2
pkgrel=2
pkgdesc='Full numeric tower support'
arch=('i686' 'x86_64')
url='http://wiki.call-cc.org/eggref/4/numbers'
license=('BSD')
depends=('chicken')

build() {
    cd "$srcdir"
    if [[ ! -e "$_pkgname" ]]; then
        chicken-install -r "$_pkgname:$pkgver"
    fi
}

package() {
    cd "$srcdir/$_pkgname"
    chicken-install -p "$pkgdir/usr"
}
