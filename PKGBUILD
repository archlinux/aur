# Maintainer: Koncz László <konlaasz at gmail dot com>

pkgname=vim-renamer-git
pkgdesc='Rename files in the Vim buffer'
pkgver=20150515
pkgrel=1
url='https://github.com/qpkorr/vim-renamer'
install=('vimdoc.install')
arch=('any')
license=('unknown')
makedepends=('git')
depends=('vim')
provides=('vim-renamer')
conflicts=('vim-renamer')
source="$pkgname::git://github.com/qpkorr/vim-renamer.git"
sha256sums='SKIP'

pkgver() {
    cd "$srcdir/$pkgname"
    local _tmpver="$(git log -n 1 --format="%cd" --date=short)"
    echo "${_tmpver//-/}"
}

package() {
    cd "$srcdir/$pkgname"
    install -dm755 $pkgdir/usr/share/vim/vimfiles/{autoload,doc,plugin}
    install -Dm644 autoload/renamer.vim $pkgdir/usr/share/vim/vimfiles/autoload/
    install -Dm644 doc/renamer.txt $pkgdir/usr/share/vim/vimfiles/doc/
    install -Dm644 plugin/renamer.vim $pkgdir/usr/share/vim/vimfiles/plugin/
}
