# Maintainer Zetta1 Reid0 <ivalin1996@gmail.com>
pkgname=xfce4-zorinmenulite-plugin
pkgver=_1.1.4
pkgrel=1
epoch=0
pkgdesc="Zorin OS Xfce menu"
arch=('any')
url="https://zorin.com/os/"
license=('GPL2')
makedepends=('cmake' 'make')
depends=('gtk3>=3.22', 'exo>=0.11' 'garcon' 'xfce4-panel>=4.11' 'libxfce4ui>=4.11' 'libxfce4util>=4.11')
source=("http://ppa.launchpad.net/zorinos/stable/ubuntu/pool/main/x/xfce4-zorinmenulite-plugin/$pkgname$pkgver.tar.xz")
sha256sums=('e5fc91ca464c004885c8ffaf5d9a3216cd7f6b5a0d2afa1df6327e88ae80487c')

build() {
	cd "$pkgname"
	cmake -DCMAKE_BUILD_TYPE=release -DCMAKE_INSTALL_PREFIX=/usr .
	make -j$(nproc)
}

package() {
	cd "$pkgname/build"
	make DESTDIR="$pkgdir/" install
}
