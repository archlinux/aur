# Maintainer: tytan652 <tytan652@tytanium.xyz>
pkgname=obs-vnc
pkgver=0.3.0
pkgrel=1
pkgdesc="This plugin is a VNC viewer that works as a source in OBS Studio"
arch=('x86_64' 'aarch64')
url="https://github.com/norihiro/obs-vnc"
license=('GPL2')
depends=("obs-studio" "libvncserver")
makedepends=("cmake")
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/norihiro/obs-vnc/archive/$pkgver.tar.gz")
sha256sums=('c13d60e4fd55a26ba866fb8aa9c2c83d2c0a44e40034a77704b67894d96c5493')

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
