# Maintainer: Nicola Squartini <tensor5@gmail.com>
_hkgname=flaccuraterip
pkgname=flaccuraterip
pkgver=0.3.7
pkgrel=1
pkgdesc="Verify FLAC files ripped from CD using AccurateRip™"
url="http://hackage.haskell.org/package/${_hkgname}"
license=('GPL3')
arch=('i686' 'x86_64')
makedepends=('ghc'
             'haskell-binary>=0.5' 'haskell-binary<0.9'
             'haskell-deepseq>=1.3' 'haskell-deepseq<1.5'
             'haskell-http>=4000.2' 'haskell-http<4000.4'
             'haskell-optparse-applicative>=0.10' 'haskell-optparse-applicative<0.14'
             'haskell-process>=1.4' 'haskell-process<1.5'
            )
depends=('gmp')
options=('strip')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
sha256sums=('b0cd908d8fe4cddc01e93cae85748717c41b183be5ce1a620ea6b4c776d4ba8f')

build() {
    cd "${srcdir}/${_hkgname}-${pkgver}"
    runhaskell Setup configure --prefix=/usr --docdir=/usr/share/doc/${pkgname} -O
    runhaskell Setup build
}

package() {
    cd "${srcdir}/${_hkgname}-${pkgver}"
    runhaskell Setup copy --destdir="${pkgdir}"
}
