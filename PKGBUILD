# Maintainer: Aldo Gunsing <dev at aldogunsing dot nl>

pkgname=klfc
pkgver=1.5.3
pkgrel=3
commit="abfc7ebd80a33a20caa50d481cfa46183258dda6"
pkgdesc="Tool to create advanced keyboard layouts in various formats"
url="https://github.com/39aldo39/klfc"
license=("GPL3")
arch=("i686" "x86_64")
makedepends=("cabal-install")
source=("https://github.com/39aldo39/klfc/archive/$commit.tar.gz")
md5sums=('7a317f99e12b95fed8c9f3b85e0ad9c8')

build() {
    cd "$srcdir/$pkgname-$commit"
    cabal v1-sandbox init
    cabal v1-update
    cabal v1-install --only-dependencies --ghc-options=-dynamic --force-reinstalls
    cabal v1-configure --prefix=/usr --ghc-options=-dynamic
    cabal v1-build
}

package() {
    cd "$srcdir/$pkgname-$commit"
    cabal v1-copy --destdir="$pkgdir"
}
