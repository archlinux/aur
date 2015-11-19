# Maintainer: Antonio Cardace <anto.cardace@gmail.com>
pkgname=dwm0statusbard-git
pkgver=0.1
pkgrel=1
pkgdesc="Dwm dynamic status bar daemon, done to help writing battery uneager status updater clients."
arch=('i686' 'x86_64')
url="https://github.com/ichigo663/dwm0statusbar"
license=('GPL3')
depends=('glibc' 'xorg-server')
provides=("$pkgname=$pkgver")
conflicts=("$pkgname")
replaces=("$pkgname")
source=("$pkgname::git+https://github.com/ichigo663/dwm0statusbar.git")
md5sums=("SKIP")

build(){
   cd "$srcdir/$pkgname"
   make
}

package() {
   cd "$srcdir/$pkgname"
   make DESTDIR="$pkgdir" PREFIXDIR=/usr install
}
