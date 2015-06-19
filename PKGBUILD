# Maintainer: Jonathan Liu <net147@gmail.com>
pkgname=vim-bitbake-git
pkgver=r50.d601f51
_gitname=vim-bitbake
pkgrel=1
pkgdesc="Vim files for the BitBake tool"
arch=('any')
url="https://github.com/kergoth/vim-bitbake"
license=('MIT')
depends=('vim')
source=('git+https://github.com/kergoth/vim-bitbake.git')
noextract=()
md5sums=('SKIP')

pkgver() {
    cd "$_gitname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$_gitname"
    install -Dm644 ftdetect/bitbake.vim "$pkgdir/usr/share/vim/vimfiles/ftdetect/bitbake.vim"
    install -Dm644 ftplugin/bitbake.vim "$pkgdir/usr/share/vim/vimfiles/ftplugin/bitbake.vim"
    install -Dm644 plugin/newbb.vim "$pkgdir/usr/share/vim/vimfiles/plugin/newbb.vim"
    install -Dm644 syntax/bitbake.vim "$pkgdir/usr/share/vim/vimfiles/syntax/bitbake.vim"
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
