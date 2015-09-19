# Maintainer: Martin Harvan <martinhrvn@gmail.com
_hkgname=leksah
pkgname=leksah
pkgver=0.12.1.3
pkgrel=1
pkgdesc="Haskell IDE written in Haskell"
url="http://hackage.haskell.org/package/${_hkgname}"
license=('GPL')
arch=('i686' 'x86_64')
makedepends=('ghc' 
    'haskell-cabal<=1.6.0.1' 'haskell-cabal>1.15' 
    'haskell-array>=0.2' 'haskell-array<0.5' 
    'haskell-binary>=0.5' 'haskell-binary<0.6' 
    'haskell-binary-shared>0.8' 
    'haskell-bytestring>=0.9.0.1' 'haskell-bytestring<0.10'
    'haskell-containers>=0.2' 'haskell-containers<0.5' 
    'haskell-deepseq>=1.1' 'haskell-deepseq<1.4'
    'haskell-directory>=1.0.0.2' 'haskell-directory<3.1'
    'haskell-filepath>=1.1.0.1' 'haskell-filepath<1.4'
    'haskell-glib>=0.10' 'haskell-glib<0.13'
    'haskell-gtk>=0.10' 'haskell-gtk<0.13'
    'haskell-gtksourceview2>=0.10' 'haskell-gtksourceview2<0.13'    
    'haskell-hslogger>=1.0.7' 'haskell-hslogger<1.2'
    'haskell-leksah-server>=0.12.1.2' 'haskell-leksah-server<0.13'
    'haskell-ltk>=0.12.1' 'haskell-ltk<0.13'
    'haskell-mtl>=1.1.0.2' 'haskell-mtl<2.2'
    'haskell-network>=2.2' 'haskell-network<3.0'
    'haskell-old-time>=1.0.0.1' 'haskell-old-time<1.2'
    'haskell-parsec>=2.1.0.1' 'haskell-parsec<3.2'
    'haskell-pretty>=1.0.1' 'haskell-pretty<1.2'
    'haskell-regex-base>0.93' 
    'haskell-regex-tdfa>=1.1' 
    'haskell-time>=0.1' 'haskell-time<1.5'
    'haskell-unix>=2.3.1' 'haskell-unix<2.6'
    'haskell-utf8-string>=0.3.1.1' 'haskell-utf8-string<0.4'
    'haskell-gio>=0.12.2' 'haskell-gio<0.13'
    'haskell-quickcheck>=2.4.2' 'haskell-quickcheck<2.5'
    'haskell-strict>=0.3.2' 'haskell-strict<2.6')
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
md5sums=('7b239fbcd67d969890e299fb7afb5985')
