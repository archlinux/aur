# Maintainer: Cedric Girard <girard.cedric@gmail.com>
pkgname=cpp-alsa-volume
_upstreamname=cppAlsaVolume
pkgver=0.3.3
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
	cmake -DUSE_PULSE=ON -DUSE_APPINDICATOR=ON -DUSE_SNI=OFF -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$_upstreamname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
sha256sums=('a6a057a49c38348c0e91104e093091a3d535308cf33fac88fd6c80eed895e10b')
