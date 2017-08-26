# Maintainer: Andy Delgado <cuba200611@gmail.com>
pkgname=np2kai-libretro-git 
pkgver=170.86c5344
pkgrel=1
pkgdesc="libretro port of the Kai fork of Neko Project 2 (a PC-98 emulator)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="http://domisan.sakura.ne.jp/article/np2kai/np2kai.html"
license=('GPL2')
groups=('libretro')
install=np2kai-libretro-git.install
makedepends=('git') 

source=('git+https://github.com/AZO234/NP2kai.git'
	'https://raw.github.com/libretro/libretro-super/master/dist/info/nekop2_libretro.info')
md5sums=('SKIP'
	'SKIP')

pkgver() {
	cd "NP2kai"
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	cd "NP2kai"
	make
}

package() {
	install -Dm644 "NP2kai/NP2kai_libretro.so" "${pkgdir}/usr/lib/libretro/NP2kai_libretro.so"
	install -Dm644 "nekop2_libretro.info" "${pkgdir}/usr/share/libretro/info/nekop2_libretro.info"
}
