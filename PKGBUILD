# Maintainer: Cedric Girard <girard.cedric@gmail.com>
pkgname=cpp-alsa-volume
_upstreamname=cppAlsaVolume
pkgver=0.2.8
pkgrel=1
pkgdesc="Tray Alsa Volume Changer written using gtkmm"
arch=('x86_64' 'i686')
url="https://github.com/Vitozz/cppAlsaVolume"
license=('GPL2')
makedepends=('gtkmm' 'glibmm' 'alsa-lib' 'cmake')
depends=('gtkmm' 'glibmm' 'alsa-lib')
source=("https://github.com/Vitozz/cppAlsaVolume/archive/v${pkgver}.tar.gz")

prepare() {
	cd "$_upstreamname-$pkgver"
}

build() {
	cd "$_upstreamname-$pkgver"
	cmake -DUSE_GTK3=OFF -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$_upstreamname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
md5sums=('9a8646e6aa2f9a0d469f41830ab0f3a6')
