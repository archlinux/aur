pkgname="mcabber-module-slack-completion"
pkgver=1.0
pkgrel=1
pkgdesc="Provides username autocompletion with @"
url="https://github.com/seletskiy/mcabber-slack-completion"
arch=('any')
license=('GPL')
makedepends=()
source=(git+https://github.com/seletskiy/mcabber-slack-completion)
md5sums=(SKIP)

pkgver() {
    cd "$srcdir/mcabber-slack-completion"

    echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
    cd "$srcdir/mcabber-slack-completion"

    make
}

package() {
    install -D "$srcdir/mcabber-slack-completion/libslack_completion.so" "$pkgdir/usr/lib/mcabber/libslack_completion.so"
}
