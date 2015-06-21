#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=beautify-css
pkgver=2013
pkgrel=1
pkgdesc='A command-line stream parser for beautifying CSS.'
arch=(i686 x86_64)
license=(GPL)
url="http://xyne.archlinux.ca/projects/beautify-css"
makedepends=(ghc haskell-parsec)
source=(
  http://xyne.archlinux.ca/projects/beautify-css/src/beautify-css-2013.tar.xz
  http://xyne.archlinux.ca/projects/beautify-css/src/beautify-css-2013.tar.xz.sig
)
sha512sums=(
  9d29b07795f2fb26c8b884014b5907f465240cd2cdb1b774214c1f57871d5e6df321ef54a223fca0cb4c8f90e4f92a9cde440bf59a686c2f66c347df3496dea8
  5aaabd1c170de31768df995213b985bed64d76ab5be347eba80ffd0d51d1f34d522fa972d12b2b2b4c063ca0e7483dfbfc9ac3fea58828804310ad80c6fad7a1
)
md5sums=(
  14fc82b748bb88bb30cdc8672bd4c6fb
  2f97cdee2199e86694a84d309729d270
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

build ()
{
  cd "$srcdir/$pkgname-$pkgver"
  ghc --make beautify-css.hs
#   upx beautify-css
}

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 beautify-css "$pkgdir"/usr/bin/beautify-css
}

# vim: set ts=2 sw=2 et:
