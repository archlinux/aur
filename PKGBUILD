# Maintainer: Arch Haskell Team <arch-haskell@haskell.org>
_hkgname=hsclock
pkgname=hsclock
pkgver=1.0
pkgrel=3
pkgdesc="An elegant analog clock using Haskell, GTK and Cairo"
url="http://hackage.haskell.org/package/${_hkgname}"
license=('GPL')
arch=('i686' 'x86_64')
makedepends=('ghc' 'haskell-cairo' 'haskell-glib' 'haskell-gtk' 'haskell-old-time=1.0.0.5')
depends=('gmp')
options=('strip')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
build() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    runhaskell Setup configure --prefix=/usr --docdir=/usr/share/doc/${pkgname} -O
    runhaskell Setup build
}
package() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    runhaskell Setup copy --destdir=${pkgdir}
}
md5sums=('1b8b100f8729e8e47fe99bd18632e8d4')
