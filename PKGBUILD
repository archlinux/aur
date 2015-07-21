# Maintainer: Nicola Squartini <tensor5@gmail.com>
_hkgname=flaccuraterip
pkgname=flaccuraterip
pkgver=0.3.4
pkgrel=1
pkgdesc="Verify FLAC files ripped from CD using AccurateRip™"
url="http://hackage.haskell.org/package/${_hkgname}"
license=('GPL3')
arch=('i686' 'x86_64')
makedepends=('ghc' 'haskell-binary>=0.5' 'haskell-binary<0.8' 'haskell-deepseq>=1.3' 'haskell-deepseq<1.5' 'haskell-http>=4000.2' 'haskell-http<4000.3' 'haskell-optparse-applicative>=0.10' 'haskell-optparse-applicative<0.12' 'haskell-process>=1.2' 'haskell-process<1.3')
depends=('gmp')
options=('strip')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
sha256sums=('108d589f27754da0f2716787c99bdcec03e6cf85326e2030805844d48275a46f')
build() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    runhaskell Setup configure --prefix=/usr --docdir=/usr/share/doc/${pkgname} -O
    runhaskell Setup build
}
package() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    runhaskell Setup copy --destdir=${pkgdir}
}
