# Maintainer: berberman <hatsue@typed.icu>

pkgname=dhall-to-cabal  
pkgver=1.3.4.0
pkgrel=1
pkgdesc="Compile Dhall expressions to Cabal files"
arch=('x86_64')
url="https://github.com/dhall-lang/${pkgname}"
license=('MIT')
makedepends=('stack')
depends=('gmp' 'zlib')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('84692e4202a0908fb667021116a1c2a3b786e6cb5e2d82d5460040eb4ef4b380')

build() {
  cd "${pkgname}-${pkgver}" 
  stack build
}

package() {
  cd "${pkgname}-${pkgver}"
  stack --local-bin-path "${pkgdir}/usr/bin/" install
  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
