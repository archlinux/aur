# Maintainer: jD91mZM2 <me@krake.one>
pkgname=xxd-vim
pkgdesc="xxd stand-alone binary from vim source tree"
url="http://vim.wikia.com/wiki/Hex_dump"
pkgver=8.0.1359
pkgrel=1
provides=('xxd')
depends=('glibc')
license=('gpl2')
arch=(i686 x86_64)
source=(http://github.com/vim/vim/archive/v$pkgver.tar.gz)
sha256sums=('78b6ae80c9066f8070b0a53ac25007450d4cfc92287827c66f6771a75b25c86f')

build () {
    cd $srcdir/vim-$pkgver/src/xxd
    make
}

package () {
    cd $srcdir/vim-$pkgver/src/xxd
    install -Dm 755 xxd $pkgdir/usr/bin/xxd
}
