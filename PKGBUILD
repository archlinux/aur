# Maintainer: Antoine Pietri <antoine.pietri@lrde.epita.fr>

pkgname=isolate-git
pkgrel=1
pkgver=1
pkgdesc="Isolate is a sandbox built to safely run untrusted executables."
arch=('i686' 'x86_64')
url="https://github.com/ioi/isolate"
license=('AGPL3')
provides=('isolate')
depends=()
makedepends=('asciidoc')
source=("git+https://github.com/ioi/isolate")
sha512sums=(SKIP)

build() {
    cd isolate
    make isolate isolate.1
}

package() {
    cd isolate
    make PREFIX="$pkgdir/usr" install install-doc
}
