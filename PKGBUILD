# Maintainer: Nicola Squartini <tensor5@gmail.com>
_hkgname=flaccuraterip
pkgname=flaccuraterip
pkgver=0.3.5
pkgrel=2
pkgdesc="Verify FLAC files ripped from CD using AccurateRip™"
url="http://hackage.haskell.org/package/${_hkgname}"
license=('GPL3')
arch=('i686' 'x86_64')
makedepends=('ghc'
             'haskell-binary>=0.5' 'haskell-binary<0.8'
             'haskell-deepseq>=1.3' 'haskell-deepseq<1.5'
             'haskell-http>=4000.2' 'haskell-http<4000.4'
             'haskell-optparse-applicative>=0.10' 'haskell-optparse-applicative<0.13'
             'haskell-process>=1.2' 'haskell-process<1.3'
            )
depends=('gmp')
options=('strip')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
sha256sums=('fa572869a54dfcea3aac395c9f1e116f9fb69cf04134411d5e8b4a88ea8ff229')

build() {
    cd "${srcdir}/${_hkgname}-${pkgver}"
    runhaskell Setup configure --prefix=/usr --docdir=/usr/share/doc/${pkgname} -O
    runhaskell Setup build
}

package() {
    cd "${srcdir}/${_hkgname}-${pkgver}"
    runhaskell Setup copy --destdir="${pkgdir}"
}
