pkgname=login-ng
_name=login_ng
pkgver=0.8.8
pkgrel=2
pkgdesc="A small session runner an systemd user slice replacement for embedded systems"
arch=('x86_64')
url="https://github.com/NeroReflex/$_name"
license=('GPL')
depends=('seatd')
optdepends=()
makedepends=(
        'cargo'
        'clang'
)
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$_name-$pkgver"
    make build
}

package() {
    cd "$srcdir/$_name-$pkgver"
    make PREFIX="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
