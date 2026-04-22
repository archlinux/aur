# Maintainer: canfro <francodvo@gmail.com>
pkgname=erwin-std-git
pkgver=r4.2961a85
pkgrel=1
arch=('any')
url="https://github.com/erwin-lang/erwin-std.git"
license=('Apache-2.0')
makedepends=('git')
pkgdesc="The Erwin programming language standard library"
depends=()
provides=('erwin-std')
conflicts=('erwin-std')
source=('git+https://github.com/erwin-lang/erwin-std.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/erwin-std"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/erwin-std"
    mkdir -p "${pkgdir}/usr/lib/erwin"
    cp -r "std" "${pkgdir}/usr/lib/erwin/"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
