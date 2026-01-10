pkgname=polyauth
pkgver=0.9.0
pkgrel=2
pkgdesc="A PAM module for Polyauth authentication"
arch=('x86_64')
url="https://github.com/NeroReflex/polyauth"
license=('GPL')
depends=('pam')
makedepends=(
    'cargo'
    'clang'    
)
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('55c9d8a3595879da576110e89cd976d4729935b95228bb9b27544c98f251dd68')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX="$pkgdir" install
}
