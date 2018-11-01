# Maintainer: Aldo Gunsing <dev at aldogunsing dot nl>

pkgname=klfc
pkgver=1.5.3
pkgrel=2
pkgdesc="Tool to create advanced keyboard layouts in various formats"
url="https://github.com/39aldo39/klfc"
license=("GPL3")
arch=("i686" "x86_64")
depends=("haskell-base-prelude>=1.2.1" "haskell-text" "haskell-bytestring"
    "haskell-semigroups" "haskell-containers" "haskell-unordered-containers"
    "haskell-vector" "haskell-aeson>=0.8.1.0" "haskell-time>=1.5" "haskell-mtl"
    "haskell-microlens-platform" "haskell-base-unicode-symbols" "haskell-megaparsec>=7"
    "haskell-filepath" "haskell-directory" "haskell-optparse-applicative" 
    "haskell-transformers" "haskell-file-embed" "haskell-xml" "haskell-chunked-data" 
    "haskell-process>=1.2.0.0")
makedepends=("cabal-install")
source=("https://github.com/39aldo39/klfc/archive/abfc7ebd80a33a20caa50d481cfa46183258dda6.tar.gz")
md5sums=('7a317f99e12b95fed8c9f3b85e0ad9c8')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cabal new-update
    cabal new-configure --prefix=/usr --ghc-options=-dynamic
    cabal new-build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    cabal copy --destdir="$pkgdir"
}
