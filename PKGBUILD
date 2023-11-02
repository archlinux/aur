# Maintainer: Vanya Sergeev <v@sergeev.io>
pkgname=luaradio
pkgver=0.11.0
pkgrel=2
pkgdesc="A lightweight, embeddable software-defined radio framework built on LuaJIT"
arch=('i686' 'x86_64' 'armv7h')
url="https://luaradio.io"
license=('MIT')
depends=('luajit' 'liquid-dsp' 'libvolk' 'fftw')
makedepends=('git')
optdepends=('gnuplot: plotting support')
source=("git+https://github.com/vsergeev/luaradio.git#tag=v$pkgver")
md5sums=('SKIP')

build() {
	cd "$pkgname"/embed
	make PREFIX="/usr" lib
}

package() {
	cd "$pkgname"/embed
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
