# Maintainer: Flaviu Tamas <aur@flaviutamas.com>
pkgname=bnfc
pkgver=2.7.1
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
_filename="BNFC-${pkgver}-linux-${arch}"
source=("http://bnfc.digitalgrammars.com/download/${_filename}.tar.gz")

[ $arch = 'i686'   ] && sha256sums=('15e9d892c4ec03edf835ed51de732d964c520c7f03c6b11544c5e010a7ebe451')
[ $arch = 'x86_64' ] && sha256sums=('85f7188cfa4544fb964c7261aa8d3c4ad084e90b3b598a0c4a6db1826bd5aae4')

package() {
  cd "${srcdir}/${_filename}/bin/"
  install -Dm755 "bnfc" "$pkgdir/usr/bin/bnfc"
}

# vim:set ts=2 sw=2 et:
