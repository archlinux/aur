# Maintainer: Mckol <mckol363@gmail.com>

pkgname=queercat-git
pkgver=r24.551c199
pkgrel=1
pkgdesc="A version of lolcat with options for some lgbtq+ flags."
arch=('any')
url="https://github.com/Elsa002/queercat"
license=('Unlicense')
depends=()
makedepends=('gcc' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+https://github.com/Elsa002/queercat")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname"

    gcc 'main.c' -lm -o 'queercat'
}

package() {
    cd "$srcdir/$pkgname"

    install -Dt "$pkgdir/usr/bin/" 'queercat'
}
