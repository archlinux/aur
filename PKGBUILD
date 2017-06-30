# Maintainer: Aldo Gunsing <dev at aldogunsing dot nl>

pkgname=klfc
pkgver=1.4.1
pkgrel=1
pkgdesc="Tool to create advanced keyboard layouts in various formats"
url="https://github.com/39aldo39/klfc"
license=("GPL3")
arch=("i686" "x86_64")
depends=("haskell-base-prelude" "haskell-text" "haskell-bytestring" "haskell-semigroups" "haskell-containers" "haskell-unordered-containers" "haskell-vector" "haskell-aeson>=0.8.1.0" "haskell-time>=1.5" "haskell-mtl" "haskell-microlens-platform" "haskell-base-unicode-symbols" "haskell-megaparsec" "haskell-filepath" "haskell-filepath" "haskell-directory" "haskell-optparse-applicative" "haskell-transformers" "haskell-file-embed" "haskell-xml" "haskell-chunked-data" "haskell-process>=1.2.0.0")
makedepends=("cabal-install")
source=("https://github.com/39aldo39/klfc/archive/v$pkgver.tar.gz")
md5sums=('05c1bbfc425de4a0401b360c51d5a3ba')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cabal update
    cabal install containers-unicode-symbols fail
    cabal configure --prefix=/usr --enable-executable-dynamic
    cabal build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    cabal copy --destdir="$pkgdir"
}
