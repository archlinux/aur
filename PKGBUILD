# Maintainer : Damien Flament <damien.flament___at___gmx___dot___com>:w
# Contributor: Daniel Nagy <danielnagy___at___gmx___dot___de>

# custom variables
_hkgname=cabal2arch
_licensefile=LICENSE

# PKGBUILD options/directives
pkgname=cabal2arch
pkgver=1.2
pkgrel=2
pkgdesc="Create Arch Linux packages from Cabal packages."
url="http://github.com/archhaskell/"
license=("BSD3")
arch=('i686' 'x86_64')
makedepends=("ghc" "haskell-archlinux" "haskell-cmdargs" "haskell-mtl")
depends=()
options=('strip' 'staticlibs' )
source=("https://github.com/archhaskell/cabal2arch/archive/v1.2.tar.gz")

sha1sums=('18936e2bafb6059f56b4814216ac5874ab54fe56')

# PKGBUILD functions
build() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    runhaskell Setup configure -O --prefix=/usr --docdir=/usr/share/doc/${pkgname}
    runhaskell Setup build
}

package() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    runhaskell Setup copy --destdir=${pkgdir}
}
