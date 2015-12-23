# Maintainer: Leif Warner <abimelech@gmail.com>
_hkgname=yesod-bin
pkgname=yesod-bin
pkgver=1.4.16.1
pkgrel=1
pkgdesc="The yesod helper executable."
url="http://hackage.haskell.org/package/${_hkgname}"
license=('custom:MIT')
arch=('i686' 'x86_64')
makedepends=('ghc' 'haskell-cabal' 'haskell-async' 'haskell-attoparsec>=0.10' 'haskell-base64-bytestring' 'haskell-blaze-builder<0.5' 'haskell-bytestring' 'haskell-conduit>=1.2' 'haskell-conduit-extra' 'haskell-containers' 'haskell-data-default-class' 'haskell-deepseq' 'haskell-directory' 'haskell-file-embed' 'haskell-filepath' 'haskell-fsnotify<0.3' 'haskell-ghc-paths>=0.1' 'haskell-http-client' 'haskell-http-conduit>=2.1.4' 'haskell-http-reverse-proxy>=0.4' 'haskell-http-types>=0.7' 'haskell-lifted-base' 'haskell-network' 'haskell-optparse-applicative>=0.11' 'haskell-parsec' 'haskell-process' 'haskell-project-template>=0.1.1' 'haskell-resourcet<1.2' 'haskell-shakespeare>=2.0' 'haskell-split<0.3' 'haskell-streaming-commons' 'haskell-tar<0.5' 'haskell-template-haskell' 'haskell-text' 'haskell-time' 'haskell-transformers' 'haskell-transformers-compat' 'haskell-unix-compat<0.5' 'haskell-unordered-containers' 'haskell-wai>=2.0' 'haskell-wai-extra' 'haskell-warp>=1.3.7.5' 'haskell-warp-tls>=3.0.1' 'haskell-yaml<0.9' 'haskell-zlib')
depends=('gmp')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
md5sums=('b042a2618d0f392f284b6f49ea33293f')
build() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    runhaskell Setup configure --prefix=/usr --docdir=/usr/share/doc/${pkgname} -O
    runhaskell Setup build
}
package() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    runhaskell Setup copy --destdir=${pkgdir}
    install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    rm -f ${pkgdir}/usr/share/doc/${pkgname}/LICENSE
}
