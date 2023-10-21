# Maintainer: Peter Semiletov peter.semiletov at gmail dot com

pkgname=bedroomstudio-git
pkgver=29e8389db4cdbd1ab2284d550e8c17607a085503
pkgrel=1
pkgdesc='A set of LV2 plugins for bedroom music studios'
arch=('x86_64')
license=('GPL')
url='https://github.com/psemiletov/bedroomstudio'
groups=('lv2-plugins' 'pro-audio')
makedepends=('git' 'cmake')
depends=('lv2')
provides=("bedroomstudio")
conflicts=("bedroomstudio")

source=("git+https://github.com/psemiletov/bedroomstudio.git")
md5sums=('SKIP')


#pkgver() {
#  cd "${srcdir}/bedroomstudio"
#  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
#}

build() {
	cd "${srcdir}/bedroomstudio"
	mkdir -p build_dir
	cd build_dir
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd "${srcdir}/bedroomstudio"
	cd build_dir
	make DESTDIR="${pkgdir}/" install
}
