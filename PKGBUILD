# Maintainer: Daichi Shinozaki <dsdseg @ gmail. com>
# Contributors: Kamil Sliwak <cameel/at/gmail/com>
# Contributors: Laszlo Papp <djszapi @ gmail at com>

pkgname=vim-erlang_detectvariables
pkgver=1.1
_scriptid=10665
pkgrel=2
pkgdesc="detect Erlang variables"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=2644"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}.zip::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('ccdaa4860b1176de991bc61fb29da05b'
         'efbd5986e691ce8c876fb86e8f5961ea')

build() {
   sed --in-place -e 's/$//g' erlang.vim
}

package() {
    AFTERSYNTAX_PATH=usr/share/vim/vimfiles/after/syntax
    install -Dm644 ${srcdir}/erlang.vim "${pkgdir}/${AFTERSYNTAX_PATH}/erlang.vim" || return 1
    install -Dm644 ${srcdir}/license.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}


