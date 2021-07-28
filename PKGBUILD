# Maintainer: alcubierre-drive
pkgname=xtrlock-pam-fp-git
pkgrel=1
pkgver=0.1.r0.g5722176
pkgdesc="xtrlock-pam patched with fprintd support (toggle to disable password waiting)"
arch=('x86_64')
url="https://github.com/alcubierre-drive/xtrlock-pam"
license=('GPL')
depends=()
makedepends=('git')
source=("$pkgname::git+$url")
sha256sums=( 'SKIP' )

pkgver() {
    cd "$pkgname"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -c 2-
}

prepare() {
    : Nothing
}

build() {
    cd "${srcdir}/${pkgname}"
    #git checkout v0.1
    make
}

check() {
    : Nothing
}

package() {
    cd "${srcdir}/${pkgname}"
    PREFIX="$pkgdir" make install
}
