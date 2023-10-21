# Maintainer: Peter Semiletov peter.semiletov at gmail dot com
pkgname=bedroomstudio
pkgver=1.0.0
pkgrel=1
pkgdesc='A set of LV2 plugins for bedroom music studios'
arch=('x86_64')
license=('GPL')
url='https://github.com/psemiletov/bedroomstudio'
groups=('lv2-plugins' 'pro-audio')
makedepends=('git' 'cmake')
depends=('lv2')
provides=("bedroomstudio")

source=("https://github.com/psemiletov/bedroomstudio/archive/${pkgver}.tar.gz")
md5sums=('fa68a3184645b2485104e8c06873183c')


build() {
	cd "${srcdir}/bedroomstudio-${pkgver}"
	mkdir -p build_dir
	cd build_dir
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd "${srcdir}/bedroomstudio-${pkgver}"
	cd build_dir
	make DESTDIR="${pkgdir}/" install
}
