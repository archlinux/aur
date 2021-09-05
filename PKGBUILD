# Maintainer: Peter Kaplan <aur@pkap.de>
pkgname=lswt
pkgver=1.0.1
pkgrel=1
pkgdesc="List Wayland toplevels"
arch=('x86_64')
url="https://git.sr.ht/~leon_plickat/lswt"
license=('GPL3')
makedepends=('git')
provides=("lswt")
source=("$pkgname-$pkgver::git+https://git.sr.ht/~leon_plickat/lswt#tag=v$pkgver"
    "makefile.patch"
)
sha256sums=('SKIP'
            '876801b43378774ed96d5c9354ee829b426ea360bd1286912507ae7f810aa705')

prepare() {
    cd "$pkgname-$pkgver"
    git apply ../makefile.patch
}

build() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX="/usr"
}

package() {
    cd "$pkgname-$pkgver"
    make install DESTDIR="$pkgdir" PREFIX="/usr"
}
