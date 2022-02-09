# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Jeremy Audet <jerebear@protonmail.com>
# Contributor: Mizuchi <ytj000+AUR@gmail.com>

pkgname=vim-undotree
pkgver=6.1
pkgrel=1
pkgdesc='Display your undo history in a graph'
arch=('any')
url='https://github.com/mbbill/undotree'
license=('BSD')
depends=('vim>=7.3')
groups=('vim-plugins') # undotree.vim needs vim7.3 with patch005 applied
source=("$pkgname.tar.gz::https://github.com/mbbill/${pkgname#vim-}/archive/rel_${pkgver}.tar.gz")
sha512sums=('ed2831fee148b6a0cb78ea528db9b6a217da67fb74d95e00034671ecd7d0bef397077a7e96c29697d372a2bd1d0a6865e210cece57c4cccd97a0cf3e0b486ec2')

package() {
  cd "${pkgname#vim-}-rel_${pkgver}"
  local _vimdir="$pkgdir/usr/share/vim/vimfiles"
  install -Dm644 {,"$_vimdir/"}"autoload/undotree.vim"
  install -Dm644 {,"$_vimdir/"}"plugin/undotree.vim"
  install -Dm644 {,"$_vimdir/"}"syntax/undotree.vim"
  install -Dm644 README.md "$pkgdir/usr/share/doc/vim-undotree/README.md"
}
