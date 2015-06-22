pkgname="urxvt-fifo"
pkgver=3.9a75925
pkgrel=1
pkgdesc="Extension for sending keys to urxvt via fifo"
url="https://github.com/kovetskiy/urxvt-fifo"
arch=('any')
license=('GPL')
makedepends=()
source=(git+https://github.com/kovetskiy/urxvt-fifo)
md5sums=(SKIP)

pkgver() {
    cd "${pkgname}"
    echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
    install -Dm644 $srcdir/$pkgname/fifo "$pkgdir"/usr/lib/urxvt/perl/fifo
}
