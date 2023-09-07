# Maintainer: Peter Semiletov peter.semiletov at gmail dot com

pkgname=drumlabooh
pkgver=0.0.4
pkgrel=1
pkgdesc='Drumlabooh is LV2/VSTi drum machine that supports Hydrogen, Drumlabooh and SFZ drumkits.'
arch=('x86_64')
license=('GPL')
url='https://github.com/psemiletov/drumlabooh'
groups=('lv2-plugins' 'pro-audio')
makedepends=('git' 'cmake' 'alsa-lib' 'freetype2' 'libx11' 'libx11' 'libxcomposite' 'libxcursor' 'libxext' 'libxinerama' 'libxrandr' 'libxrender')
depends=('glibc' 'gcc-libs' 'alsa-lib' 'freetype2')


provides=("drumlabooh")
source=("https://github.com/psemiletov/drumlabooh/archive/${pkgver}.tar.gz")
md5sums=('aacc2020367ee0e90c2c72757291839d')

build() {
	cd "${srcdir}/drumlabooh-${pkgver}"
	mkdir -p build_dir
	cd build_dir
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd "${srcdir}/drumlabooh-${pkgver}"
	cd build_dir
	make DESTDIR="${pkgdir}/" install
}
