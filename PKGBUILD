# Maintainer: Peter Semiletov peter.semiletov at gmail dot com
pkgname=beseda
pkgver=1.5.1
pkgrel=1
pkgdesc='Accessibility ebook speech reader'
arch=('x86_64')
license=('GPL')
url='https://github.com/psemiletov/beseda'
groups=('lv2-plugins' 'pro-audio')
depends=('libspeechd' 'ncurses' 'speech-dispatcher')
makedepends=('git' 'cmake')
provides=("beseda")

source=("https://github.com/psemiletov/beseda/archive/${pkgver}.tar.gz")
md5sums=('9ccf97b407c4e818c1a85dc3b91d2308')

build() {
	cd "${srcdir}/beseda-${pkgver}"
	mkdir -p build_dir
	cd build_dir
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd "${srcdir}/beseda-${pkgver}"
	cd build_dir
	make DESTDIR="${pkgdir}/" install
}
