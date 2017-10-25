# Maintainer: bitwave <aur [at] oomlu [d0t] de>

pkgname=lemon-lang-git
pkgver=13.9a0b3db
pkgrel=1
pkgdesc="An embeddable, lightweight programming language in ANSI C"
arch=(i686 x86_64)
url="http://www.lemon-lang.org/"
license=('mit')
depends=()
source=('git://github.com/lemon-lang/lemon/')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/lemon"
    echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
    cd "$srcdir/lemon"
    make STATIC=1
}

package() {
    cd "$srcdir/lemon"
    install -Dm 755 $srcdir/lemon/lemon $pkgdir/usr/bin/lemon
}

