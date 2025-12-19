# Maintainer: Peter Semiletov peter.semiletov at gmail dot com

pkgname=drumlabooh
pkgver=12.0.0
pkgrel=1
pkgdesc='LV2/VSTi drum machine that supports Hydrogen, Drumlabooh and SFZ drumkits'
arch=('x86_64')
license=('GPL')
url='https://github.com/psemiletov/drumlabooh'
groups=('lv2-plugins' 'pro-audio')
makedepends=('git' 'cmake')
depends=('glibc' 'gcc-libs' 'alsa-lib' 'freetype2' 'libx11' 'libxcomposite' 'libxcursor' 'libxext' 'libxinerama' 'libxrandr' 'libxrender')
provides=("drumlabooh")
source=("https://github.com/psemiletov/drumlabooh/archive/${pkgver}.tar.gz")
md5sums=('fac6d3ee8bbf799c9123b8f5a20e739c')

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
