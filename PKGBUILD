# Maintainer: Felip Manyer i Ballester <archlinux at res hyphen telae dot cat>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-auto-pairs
pkgver=1.3.2
_srcid=20536
pkgrel=1
pkgdesc="Autoclose, insert or delete brackets, parens, quotes in pair"
arch=('any')
depends=('vim')
groups=('vim-plugins')
url="http://www.vim.org/scripts/script.php?script_id=3599"
license=('MIT')
source=(${pkgname}.tar.gz::http://www.vim.org/scripts/download_script.php?src_id=${_srcid})
sha256sums=('a3fa1b60b2eb54e617b3d4279c0ee78b1bf9ee4f38ea398e341d6c8ac9297652')
install=vimdoc.install

package() {
  cd "$srcdir/${pkgname##vim-}"

  msg 'Installing documentation...'
  install -Dm 644 README.md $pkgdir/usr/share/doc/vim-auto-pairs/README.md

  msg 'Installing appdirs...'
  install -dm 755 $pkgdir/usr/share/vim/vimfiles
  for _appdir in plugin; do
    cp -dpr --no-preserve=ownership $_appdir $pkgdir/usr/share/vim/vimfiles/$_appdir
  done
}
