# Maintainer: Cedric Girard <girard.cedric@gmail.com>
pkgname=cpp-alsa-volume-gtk2
_pkgname=cpp-alsa-volume
_upstreamname=cppAlsaVolume
pkgver=0.3.2
pkgrel=2
pkgdesc="Tray Alsa Volume Changer written using gtkmm"
arch=('x86_64' 'i686')
url="https://github.com/Vitozz/cppAlsaVolume"
license=('GPL2')
makedepends=('gtkmm' 'glibmm' 'alsa-lib' 'cmake')
depends=('gtkmm' 'glibmm' 'alsa-lib')
source=("https://github.com/Vitozz/cppAlsaVolume/archive/v${pkgver}.tar.gz")
provides=("$_pkgname=$pkgver")
conflicts=($_pkgname)

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
md5sums=('67ae1a6a621f76aa1f6e8a1ff863c9e8')
