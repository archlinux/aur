# Maintainer: Benson Chau <bchau3440@gmail.com>
# Contributer: Piotr Rogoza <rogoza dot piotr at gmail dot com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

pkgname=vim-notes
pkgver=0.33.4
pkgrel=2
pkgdesc="Easy note taking in Vim "
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=3375"
_src_id=23710
license=('MIT')
groups=('vim-plugins')
depends=(python vim-misc-xolox)
conflicts=(vim-notes-git)
install='vimdoc.install'
source=("${pkgname}-${pkgver}.zip::http://www.vim.org/scripts/download_script.php?src_id=$_src_id")
sha256sums=('872971b6376483acd77dec3fa850f69b3a2ef1186714db33fc5c97f3064cadf4')

package() {
	cd "$srcdir"
    _vim_dir='/usr/share/vim/vimfiles/'
    install -d "$pkgdir"/$_vim_dir

    tar -c ./ \
        --exclude $pkgname-$pkgver.zip \
        --exclude INSTALL.md \
        --exclude README.md \
        --exclude TODO.md \
        --exclude autoload/xolox/misc \
        --exclude .gitignore \
        --exclude addon-info.json \
        | tar -x -C "$pkgdir"/$_vim_dir
}
