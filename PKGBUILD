# Maintainer: Cedric Girard <girard.cedric@gmail.com>
pkgname=cpp-alsa-volume
_upstreamname=cppAlsaVolume
pkgver=0.3.2
pkgrel=1
pkgdesc="Tray Alsa Volume Changer written using gtkmm"
arch=('x86_64' 'i686')
url="https://github.com/Vitozz/cppAlsaVolume"
license=('GPL2')
makedepends=('gtkmm3' 'glibmm' 'alsa-lib' 'libpulse' 'libappindicator-gtk3' 'cmake')
depends=('gtkmm' 'glibmm' 'alsa-lib' 'libpulse' 'libappindicator-gtk3')
source=("https://github.com/Vitozz/cppAlsaVolume/archive/v${pkgver}.tar.gz")

prepare() {
	cd "$_upstreamname-$pkgver"
}

build() {
	cd "$_upstreamname-$pkgver"
	cmake -DUSE_PULSE=ON -DUSE_APPINDICATOR=ON -DUSE_SNI=ON -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$_upstreamname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
md5sums=('67ae1a6a621f76aa1f6e8a1ff863c9e8')
