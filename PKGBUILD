# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Contributor: Kohichi Aoki <drikin@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=tty-clock-borderless
gitname=tty-clock
pkgver=0.1
pkgrel=2
pkgdesc="tty-clock with borderless-option"
arch=('i686' 'x86_64')
url="http://github.com/xorg62/$gitname"
license=('BSD')
depends=('ncurses')
conflicts=('tty-clock' 'tty-clock-git')
makedepends=('git')
source=("git://github.com/xorg62/$gitname.git#tag=v$pkgver"
	$pkgname.patch)
md5sums=('SKIP'
         '9b81ff67153aa2678e31fd90622bb68d')

prepare() {
	cd "$srcdir/$gitname"
	patch -p1 < ../$pkgname.patch
}

build() {
	cd "$srcdir/$gitname"
	make
}

package() {
  cd "$srcdir/$gitname"
  install -Dm 755 $gitname "$pkgdir/usr/bin/$gitname"
}
