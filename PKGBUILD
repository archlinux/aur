# Maintainer: Felip Manyer i Ballester <archlinux at res hyphen telae dot cat>
# Contributor: Slobodan Paunovic <slobodan dot paunovic at gmail dot com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Laszlo Papp <djszapi2 at gmail dot com>
# Contributor: kalio <okalio _at_ gmx dot com>

pkgname=vim-csapprox
pkgver=4.0
_srcid=18594
pkgrel=1
pkgdesc="Make gvim-only colorschemes work transparently in terminal vim"
arch=('any')
depends=('vim')
groups=('vim-plugins')
url="http://www.vim.org/scripts/script.php?script_id=2390"
license=('custom')
source=(${pkgname}.zip::http://www.vim.org/scripts/download_script.php?src_id=$_srcid
        license.txt)
sha256sums=('1f8548424fd914a8e23e905682c0a523630c5208fb2251461d9587205f26bd14'
            '4689a6d3ed3bca186ab8fea8360f32fdbb84f84c82fb21698390202efa7b7d19')
install=vimdoc.install

package() {
  cd "$srcdir"

  msg 'Installing license...'
  install -D -m644 license.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in after autoload doc plugin; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done
}
