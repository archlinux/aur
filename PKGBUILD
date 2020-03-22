# Maintainer: Rodrigo Gryzinski <rogryza@gmail.com>

pkgname=vim-dracula
pkgver=2.0.0
pkgrel=3
pkgdesc="A dark theme for Vim"
arch=('any')
url="https://draculatheme.com/vim"
license=('MIT')
depends=('vim')
groups=('vim-plugins')
source=("${pkgname}-${pkgver}::https://github.com/dracula/vim/archive/v${pkgver}.tar.gz")
sha512sums=('cd86681aff1bd5dfc3b6747e7468fa192776c00cd10dbf6ae99703a679f2576d7c9e1439a829c22459b7bc3248d3657213c6a8d68acd579bb90cf496fa089c71')

package() {
  VIMFILES=$pkgdir/usr/share/vim/vimfiles
  install -d "$VIMFILES"

  cd ${srcdir}/vim-${pkgver}
  cp -drr --no-preserve=ownership after $VIMFILES
  cp -drr --no-preserve=ownership autoload $VIMFILES
  cp -drr --no-preserve=ownership colors $VIMFILES
  cp -drr --no-preserve=ownership doc $VIMFILES
}
