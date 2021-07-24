# Maintainer: alcubierre-drive
pkgname=xtrlock-pam-fp-git
pkgrel=1
pkgver=0.1
pkgdesc="xtrlock-pam patched with fprintd support (toggle to disable password waiting)"
arch=('any')
url="https://github.com/alcubierre-drive/xtrlock-pam"
license=('GPL')
depends=()
makedepends=()
source=("$pkgname::git+$url")
sha256sums=( 'SKIP' )

pkgver() {
    printf 0.1
}

prepare() {
    : Nothing
}

build() {
    cd "${srcdir}/${pkgname}"
    git checkout 5722176d97e2c3afcb271e1c3f30107b5cbfcc8a
    make
}

check() {
    : Nothing
}

package() {
    cd "${srcdir}/${pkgname}"
    PREFIX=$pkgdir make install
}
