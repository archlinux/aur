# Maintainer: Daan van Rossum <d.r.vanrossum @ gmx . de>
pkgname=vim-visincr
pkgver=20
_scriptid=16281
pkgrel=2
pkgdesc="Produce increasing/decreasing columns of numbers, dates, or daynames"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=670"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}.vba.gz::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)
md5sums=('c306a1521171156abeb04390fee554fa'
         'efbd5986e691ce8c876fb86e8f5961ea')

package() {
    install -d ${pkgdir}/usr/share/vim/vimfiles/{doc,plugin,autoload}
    vim -c "UseVimball $srcdir" -c "q" ${pkgname}.vba
    install -Dm755 ${srcdir}/doc/* ${pkgdir}/usr/share/vim/vimfiles/doc/ || return 1
    rm ${pkgdir}/usr/share/vim/vimfiles/doc/tags
    install -Dm755 ${srcdir}/plugin/* ${pkgdir}/usr/share/vim/vimfiles/plugin/ || return 1
    install -Dm755 ${srcdir}/autoload/* ${pkgdir}/usr/share/vim/vimfiles/autoload/ || return 1
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}

