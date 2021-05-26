# Maintainer: tytan652 <tytan652@tytanium.xyz>
pkgname=obs-vnc
pkgver=0.3.1
pkgrel=1
pkgdesc="This plugin is a VNC viewer that works as a source in OBS Studio"
arch=('x86_64' 'aarch64')
url="https://github.com/norihiro/obs-vnc"
license=('GPL2')
depends=("obs-studio" "libvncserver")
makedepends=("cmake")
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/norihiro/obs-vnc/archive/$pkgver.tar.gz")
sha256sums=('d16ccaa52a8471643094fe0145059620320f13bd498bf7595f0956ab515da489')

build() {
        cd "$pkgname-$pkgver"
        cmake -B build \
        -DCMAKE_INSTALL_PREFIX='/usr'
        make -C build
}

package() {
	cd "$pkgname-$pkgver"
	make -C build DESTDIR="$pkgdir/" install
}
