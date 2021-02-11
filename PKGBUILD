# Maintainer: Felip Manyer i Ballester <archlinux at res hyphen telae dot cat>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-auto-pairs
pkgver=2.0.0
pkgrel=1
pkgdesc="Autoclose, insert or delete brackets, parens, quotes in pair"
arch=('any')
depends=('vim')
groups=('vim-plugins')
url="http://www.vim.org/scripts/script.php?script_id=3599"
license=('MIT')
source=(${pkgname}.tar.gz::https://github.com/jiangmiao/auto-pairs/archive/v${pkgver}.tar.gz)
sha256sums=('f20e109a61b4640eb424ada90200ff578027e5307c1202b103c265a9cfa193c4')
install=vimdoc.install

package() {
  cd "$srcdir/${pkgname##vim-}-${pkgver}"

  msg 'Installing documentation...'
  install -Dm 644 README.md $pkgdir/usr/share/doc/vim-auto-pairs/README.md

  msg 'Installing appdirs...'
  install -dm 755 $pkgdir/usr/share/vim/vimfiles
  for _appdir in plugin; do
    cp -dpr --no-preserve=ownership $_appdir $pkgdir/usr/share/vim/vimfiles/$_appdir
  done
}
