# Maintainer Zetta1 Reid0 <ivalin1996@gmail.com>

pkgname=xfce4-zorinmenulite-plugin
pkgver=1.1.4
_ver="_$pkgver"
pkgrel=4
epoch=0
pkgdesc="Zorin Menu Lite is the default application launcher in Zorin OS Lite."
arch=('any')
url="https://zorin.com/os/"
license=('GPL2')
makedepends=('cmake' 'make' 'pkgconf')
depends=('gtk3>=3.22' 'exo>=0.11' 'garcon>=0.6' 'xfce4-panel>=4.11' 'libxfce4ui>=4.11' 'libxfce4util>=4.9' 'gettext>=0.6.0')
source=("http://ppa.launchpad.net/zorinos/stable/ubuntu/pool/main/x/xfce4-zorinmenulite-plugin/$pkgname$_ver.tar.xz")

sha1sums=('bdc30fb1ead8d40e288549eee25d696cd83719f4')
sha256sums=('e5fc91ca464c004885c8ffaf5d9a3216cd7f6b5a0d2afa1df6327e88ae80487c')

build() {
	cd "$pkgname"
	cmake -DCMAKE_BUILD_TYPE=release -DCMAKE_INSTALL_PREFIX=/usr .
	make -j$(nproc)
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
}
