# Maintainer: Felip Manyer i Ballester <archlinux at res hyphen telae dot cat>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>

pkgname=vim-misc-xolox
pkgver=1.17.6
pkgrel=2
_src_id=23300
pkgdesc='Miscellaneous auto-load Vim scripts'
arch=('any')
url='http://peterodding.com/code/vim/misc'
#url='http://www.vim.org/scripts/script.php?script_id=4597'
license=('MIT')
conflicts=(vim-misc-xolox-git)
source=("${pkgname}-${pkgver}.zip::http://www.vim.org/scripts/download_script.php?src_id=$_src_id")
sha256sums=('139910538cb3377edc9d0f41dc800e66d83bbfce3bf6d704c556eccdbb0eae54')

build() {
  cd "$srcdir"
  find . -type f -name "*.md" -exec rm -f {} \;
  rm addon-info.json
  rm .gitignore
}

package() {
  cd "$srcdir"
  _vim_dir='/usr/share/vim/vimfiles'
  install -dm755 "$pkgdir"/$_vim_dir
  cp -r {autoload,doc,plugin} "$pkgdir"/$_vim_dir
}
