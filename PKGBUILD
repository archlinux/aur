# Maintainer:  Maxime Poulin <maxpoulin64@gmail.com>
# Controbutor: xpander <xpander0@gmail.com>
pkgname=glxosd
pkgver=2.5.0
pkgrel=1
pkgdesc="An OSD for OpenGL applications running under the X Window System. This allows you to monitor your framerate and hardware temperature in games on Linux!"
arch=('i686' 'x86_64')
url="https://github.com/nickguletskii/GLXOSD"
license=('GPL')
groups=()
depends=('mesa' 'glu' 'fontconfig' 'freetype2' 'lm_sensors' 'libxext')
makedepends=('cmake' 'gcc' 'git' 'boost' 'libxnvctrl')
source=("git://github.com/nickguletskii/GLXOSD.git#tag=$pkgver")
md5sums=('SKIP')

build() {
	cd "$srcdir/GLXOSD"
	cmake -DCMAKE_INSTALL_PREFIX=/usr -G "Unix Makefiles" 
	make all
}

package() {
	cd "$srcdir/GLXOSD"
	make DESTDIR="$pkgdir/" install
	cp -r $pkgdir/usr/lib/glxosd/. $pkgdir/usr/lib/
}
