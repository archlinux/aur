# Contributor: OK100 <ok100.ok100.ok100@gmail.com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=vitunes
pkgver=2.3
pkgrel=1
pkgdesc="A curses-based playlist manager and media player for *nix operating systems with vim-like keybindings."
arch=('i686' 'x86_64')
license=('custom')
url="http://vitunes.org"
depends=('taglib' 'mplayer' 'ncurses')
makedepends=('make' 'gcc')
options=(!buildflags)
source=("http://vitunes.org/files/$pkgname-$pkgver.tar.gz")
md5sums=('9e78c60cee0f780c7c157933efbd9baa')
sha1sums=('3e62aad57d48ac6bc37d4fee1804b6053fdd30a3')
sha256sums=('52f96e3db94f845cd280c5fd2b35bd53ec97cf0cdb7e4b44d936a77d467eba36')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make linux
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm0555 vitunes $pkgdir/usr/bin/vitunes
  install -Dm0444 vitunes.1 $pkgdir/usr/share/man/man1/vitunes.1
}

