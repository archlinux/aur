# Maintainer: Vanya Sergeev <vsergeev@gmail.com>
pkgname=luaradio
pkgver=0.1.0
pkgrel=1
pkgdesc="A lightweight, embeddable software-defined radio framework built on LuaJIT"
arch=('i686' 'x86_64' 'armv7h')
url="http://luaradio.io"
license=('MIT')
depends=('luajit' 'liquid-dsp-git')
optdepends=('libvolk' 'fftw')
source=("git+https://github.com/vsergeev/luaradio.git#tag=v$pkgver")
md5sums=('SKIP')

build() {
	cd "$pkgname"/embed
	make lib
}

package() {
	cd "$pkgname"/embed
	make DESTDIR="$pkgdir/" install
}
