# Maintainer: M. Scholz
pkgname=tex-math-millennial
pkgver=0.1
pkgrel=1
pkgdesc="A math accompaniment for New Century Schoolbook (for texlive)"
license=('custom')
arch=('any')
url="http://www.math.ucdenver.edu/~hartkes/computer/latex/latex.php"
depends=(texlive-core texlive-fontsextra)
install=$pkgname.install
source=(
'http://www.math.ucdenver.edu/~hartkes/computer/latex/Millennial-20110819.tar.bz2'
'tex-math-millennial.maps'
)
sha1sums=('cc124a2dca39d4627a72fe74d0c131e3ea65bf40'
          '201b2d7967085b8c84a6268a2bc2a5c095b35a19')

# modelled after urw-garamond

package() {
  cd "$srcdir"

  install -d -m755 "$pkgdir/var/lib/texmf/arch/installedpkgs"
  install -m 644 "${pkgname}.maps" "$pkgdir/var/lib/texmf/arch/installedpkgs"

  install -d -m755 "$pkgdir/usr/share"
  cp -rb ./texmf "$pkgdir/usr/share"

  rm -rf "$pkgdir/usr/share/texmf/doc"
  install -D texmf/doc/fonts/millennial/README "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
