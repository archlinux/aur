# Maintainer: Peter Semiletov peter.semiletov at gmail dot com
pkgname=beseda
pkgver=1.4.0
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
md5sums=('398ff462267df04f1b6591491b8c48ed')

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
