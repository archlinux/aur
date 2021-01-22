# Maintainer: tytan652 <tytan652@tytanium.xyz>
pkgname=obs-vnc
pkgver=0.2.2
pkgrel=1
pkgdesc="This plugin is a VNC viewer that works as a source in OBS Studio"
arch=('x86_64' 'aarch64')
url="https://github.com/norihiro/obs-vnc"
license=('GPL2')
depends=(obs-studio libvncserver)
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/norihiro/obs-vnc/archive/0.2.2.tar.gz")
sha256sums=('b8d4e1ad9e275e7a08f7c144258b040645a04964e6bf870a6b7e9fbc7948608b')

build() {
        cd "$pkgname-$pkgver"
        cmake -B build \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
	-Wno-dev
        make -C build
}

package() {
	cd "$pkgname-$pkgver"
	make -C build DESTDIR="$pkgdir/" install
}
