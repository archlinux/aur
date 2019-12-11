#Maintainer: oshaboy <noamgilor{at}protonmail{dot}com>

pkgname=fanwor
pkgver=1
pkgrel=1
pkgdesc="An adventure game with heavy inspiration from The Legend of Zelda"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="http://fanwor.tuxfamily.org/"
license=('GPLv2')
depends=(sdl2 libpng glibc zlib sdl2_mixer)
optdepends=()
makedepends=(gcc)
source=("git+git://git.tuxfamily.org/gitroot/fanwor/fanwor.git")
sha256sums=('SKIP')
build() {
	cd fanwor
	make
	echo -e $run_script >| ${srcdir}/fanwor.sh
}
run_script='cd /opt/fanwor && ./fanwor'
package(){
	mkdir ${pkgdir}/opt ${pkgdir}/opt/fanwor ${pkgdir}/usr ${pkgdir}/usr/bin/ 
	cp -r ${srcdir}/fanwor/* ${pkgdir}/opt/fanwor
	install -Dm755 ${srcdir}/fanwor.sh ${pkgdir}/usr/bin/fanwor
	chmod 755 ${pkgdir}/opt/fanwor	
	
}
