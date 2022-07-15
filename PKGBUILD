#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=beautify-css
pkgver=2013
pkgrel=5
pkgdesc='A command-line stream parser for beautifying CSS.'
arch=(i686 x86_64)
license=(GPL)
url="https://xyne.dev/projects/beautify-css"
makedepends=(ghc haskell-parsec)
source=(
  https://xyne.dev/projects/beautify-css/src/beautify-css-2013.tar.xz
  https://xyne.dev/projects/beautify-css/src/beautify-css-2013.tar.xz.sig
)
sha512sums=(
  9d29b07795f2fb26c8b884014b5907f465240cd2cdb1b774214c1f57871d5e6df321ef54a223fca0cb4c8f90e4f92a9cde440bf59a686c2f66c347df3496dea8
  e08b488d8ac4e7febd5c8cfefdc39293a3bafec648235459796dd32aba789b7f570852f6743bd09b40c4786e5e4e0405bdaaf8d977af7aa2e3d1989f1aec4ada
)
md5sums=(
  14fc82b748bb88bb30cdc8672bd4c6fb
  84aab61a3bdd7d4ce29e1708f96f2dac
)
validpgpkeys=('D89FAAEB4CECAFD199A2F5E612C6F735F7A9A519')

build ()
{
  cd "$srcdir/$pkgname-$pkgver"
  ghc -dynamic --make beautify-css.hs
#   upx beautify-css
}

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 beautify-css "$pkgdir"/usr/bin/beautify-css
}

# vim: set ts=2 sw=2 et:
