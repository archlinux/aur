# Maintainer: tytan652 <tytan652@tytanium.xyz>
pkgname=obs-vnc
pkgver=0.4.0
_obsver=27.0.0
pkgrel=1
pkgdesc="This plugin is a VNC viewer that works as a source in OBS Studio"
arch=("i686" "x86_64" "aarch64")
url="https://obsproject.com/forum/resources/vnc-source.1000/"
license=("GPL2")
depends=("obs-studio>=$_obsver" "libvncserver")
makedepends=("cmake")
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/norihiro/obs-vnc/archive/$pkgver.tar.gz")
sha256sums=("c61397314c7cc0518beb7cfcfa89a391039241200fad0e61d01552a3ceceaa57")

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
