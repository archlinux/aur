# Maintainer: amesgen <amesgen AT amesgen DOT de>
# Contributor: Rodrigo Gryzinski <rogryza@gmail.com>

pkgname=ghcide
pkgver=0.0.6
pkgrel=2
pkgdesc="A library for building Haskell IDE tooling"
arch=('x86_64')
url="https://github.com/digital-asset/${pkgname}"
license=('Apache')
depends=('gmp' 'zlib')
makedepends=('stack')
source=("${pkgname}-${pkgver}::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('1a9fe8899145eb5ac5c7b9ea0f3522045b64aecf40c762b45677824bb7de290a')

build() {
  cd "${pkgname}-${pkgver}"
  stack build
}

package() {
  cd "${pkgname}-${pkgver}"
  stack install ghcide:exe:ghcide --local-bin-path "${pkgdir}/usr/bin"
  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
