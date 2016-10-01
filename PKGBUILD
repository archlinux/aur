# Maintainer: Mihails Strasuns <public@dicebot.lv>
pkgname=xxd-vim
pkgdesc="xxd stand-alone binary from vim source tree"
url="http://vim.wikia.com/wiki/Hex_dump"
pkgver=8.0.0013
pkgrel=2
provides=('xxd')
depends=('glibc')
license=('gpl2')
arch=(i686 x86_64)
source=(vim-$pkgver.tar.gz::http://github.com/vim/vim/archive/v$pkgver.tar.gz)
sha256sums=('46b509cd0c4d085cfec60b2e8d30daca568908c4d7dbcaa2af586ed897cc8d4b')

build ()
{
    cd $srcdir/vim-$pkgver/src/xxd
    make
}

package ()
{
    mkdir -p $pkgdir/usr/bin
    install -m755 $srcdir/vim-$pkgver/src/xxd/xxd $pkgdir/usr/bin/
}
