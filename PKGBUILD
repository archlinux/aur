# Maintainer: Aldo Gunsing <dev at aldogunsing dot nl>
# Maintainer: Rohit Goswami (HaoZeke) <rohit dot goswami at aol dot com>

pkgname=klfc
pkgver=1.5.5
pkgrel=5
commit="58af59c0cce2c0aa9a2c311231d4da9a5947259e"
pkgdesc="Tool to create advanced keyboard layouts in various formats"
url="https://github.com/39aldo39/klfc"
license=("GPL3")
arch=("i686" "x86_64")
makedepends=("cabal-install" "ghc")
source=("https://github.com/39aldo39/klfc/archive/$commit.tar.gz")
md5sums=('4817cbc1028974b2c3f692ed454b5aba')

build() {
    cd "$srcdir/$pkgname-$commit"
    cabal v1-update
    cabal v1-install --only-dependencies --ghc-options=-dynamic --force-reinstalls
    cabal v1-configure --prefix=/usr --ghc-options=-dynamic
    cabal v1-build
}

package() {
    cd "$srcdir/$pkgname-$commit"
    cabal v1-copy --destdir="$pkgdir"
}
