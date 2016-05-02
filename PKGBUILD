# Maintainer: Flaviu Tamas <aur@flaviutamas.com>
pkgname=bnfc
pkgver=2.8
pkgrel=1
pkgdesc="The BNF Converter is a compiler construction tool generating a compiler front-end from a Labelled BNF grammar. It is currently able to generate C, C++, C#, Haskell, Java, and OCaml, as well as XML representations."
url="http://bnfc.digitalgrammars.com/"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('gmp')
optdepends=(
  'ghc: haskell output'
  'happy: haskell output'
  'alex: haskell output'
)
[ $arch = 'i686'   ] && _filename="bnfc-${pkgver}-linux32"
[ $arch = 'x86_64' ] && _filename="bnfc-${pkgver}-linux64"
source=("https://github.com/BNFC/bnfc/releases/download/v${pkgver}/${_filename}.tar.gz")

[ $arch = 'i686'   ] && sha256sums=('67c84d2eb58a15d3e81764ce91413e91833e139344f8d7eb9d66d42d73e8a956')
[ $arch = 'x86_64' ] && sha256sums=('350f1dcd5bb5fce4742a705051e09104e7e0d3bebdfd1f66b7e5839465136cd7')

package() {
  cd "${srcdir}/${_filename}/"
  install -Dm755 "bnfc" "$pkgdir/usr/bin/bnfc"
}

# vim:set ts=2 sw=2 et:
