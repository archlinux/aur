# Maintainer: barchiesi <dlbarchiesi at gmail dot com>
# Contributor: koral <koral at mailoo dot org>

_scriptid=14758
pkgname="vim-delimitmate"
pkgver=2.6
pkgrel=1
pkgdesc="Provides auto-balancing and some expansions for parens, quotes, etc."
arch=(any)
url="http://www.vim.org/scripts/script.php?script_id=2754"
license=('unknown')
groups=('vim-plugins')
depends=('vim')
source=(${pkgname}.vba::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid})
md5sums=('7aa765483e79095f4532835106acfbb9')

package() {
    cd ${srcdir}

    /usr/bin/vim -c ":UseVimball ." -c ":q" ${pkgname}.vba

    install -Dm644 autoload/delimitMate.vim   ${pkgdir}/usr/share/vim/vimfiles//autoload/delimitMate.vim
    install -Dm644 doc/delimitMate.txt        ${pkgdir}/usr/share/vim/vimfiles//doc/delimitMate.txt
    install -Dm644 plugin/delimitMate.vim     ${pkgdir}/usr/share/vim/vimfiles//plugin/delimitMate.vim
}
