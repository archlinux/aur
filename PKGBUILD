# Maintainer: Vanya Sergeev <vsergeev@gmail.com>
pkgname=luaradio
pkgver=0.5.1
pkgrel=1
pkgdesc="A lightweight, embeddable software-defined radio framework built on LuaJIT"
arch=('i686' 'x86_64' 'armv7h')
url="http://luaradio.io"
license=('MIT')
depends=('luajit')
optdepends=('liquid-dsp: acceleration'
            'libvolk: acceleration'
            'fftw: acceleration'
            'gnuplot: plotting support')
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
