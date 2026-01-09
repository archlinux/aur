pkgname=sessionrunner
pkgver=0.9.6
pkgrel=1
pkgdesc="A small session runner an systemd user slice replacement for embedded systems"
arch=('x86_64')
url="https://github.com/NeroReflex/sessionrunner"
license=('GPL')
depends=()
optdepends=(
    'gamescope: for game session'
    'plasma: for KDE session'
    'weston: for Weston session'
)
makedepends=('cargo')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('dec523c3b9dbb95cf74075a7f1a2e7f10aeacbb4fbc388a4f484d7c1b6e51f75')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX="$pkgdir" install
}
