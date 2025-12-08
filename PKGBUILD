# Maintainer: voxan <dev at hessfr dot fr>

pkgname=klfc
pkgver=1.5.7
pkgrel=5
pkgdesc="Tool to create advanced keyboard layouts in various formats"
url="https://github.com/39aldo39/klfc"
license=("GPL3")
arch=("x86_64")
makedepends=("cabal-install" "ghc")
source=("https://github.com/39aldo39/klfc/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('a64f3b32030a2182c20c4d00e5d5f01d')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cabal v1-update
    cabal v1-install --only-dependencies --ghc-options=-dynamic --force-reinstalls
    cabal v1-configure --prefix=/usr --ghc-options=-dynamic
    cabal v1-build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    cabal v1-copy --destdir="$pkgdir"
}
