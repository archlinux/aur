# Maintainer: Tomasz Zok <tomasz.zok [at] gmail.com>

pkgname=vim-pandoc-markdown-preview-git
pkgdesc='Vim plugin for previewing pandoc markdown'
pkgver=20190627
pkgrel=1
url=https://github.com/conornewton/vim-pandoc-markdown-preview
arch=(any)
license=(GPL)
makedepends=(git)
depends=(vim)
provides=(vim-pandoc-markdown-preview)
conflicts=()
source=("$pkgname::git://github.com/conornewton/vim-pandoc-markdown-preview")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    local _tmpver="$(git log -n 1 --format="%cd" --date=short)"
    echo "${_tmpver//-/}"
}

package() {
    cd "$srcdir/$pkgname"
    install -dm755 $pkgdir/usr/share/vim/vimfiles/{ftdetect,ftplugin}
    install -Dm644 ftdetect/* $pkgdir/usr/share/vim/vimfiles/ftdetect/
    install -Dm644 ftplugin/* $pkgdir/usr/share/vim/vimfiles/ftplugin/
}
