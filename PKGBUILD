# Maintainer: Rodrigo Gryzinski <rogryza@gmail.com>

pkgname=vim-dracula
pkgver=2.0.0
pkgrel=1
pkgdesc="A dark theme for Vim"
arch=('any')
url="https://draculatheme.com/vim"
license=('MIT')
depends=('vim')
source=("${pkgname}-${pkgver}::https://github.com/dracula/vim/archive/v${pkgver}.tar.gz")
sha512sums=('cd86681aff1bd5dfc3b6747e7468fa192776c00cd10dbf6ae99703a679f2576d7c9e1439a829c22459b7bc3248d3657213c6a8d68acd579bb90cf496fa089c71')

package() {
  VIMFILES=$pkgdir/usr/share/vim/vimfiles
  cd ${srcdir}/vim-${pkgver}
  mkdir -p $VIMFILES
  for dir in after autoload colors doc; do
    cp -r "$dir" $VIMFILES
    chmod 755 -R $VIMFILES/$dir
  done
}
