# Maintainer: Hiromon <iamhirotokun@gmail.com>

pkgname=xfce4-zorinappgridlite-plugin
pkgver=1.0.0
_ver="_$pkgver"
pkgrel=1
epoch=0
pkgdesc="Xfce4 panel plugin for Zorin AppGrid Lite"
arch=('any')
url="https://zorin.com/os/"
license=('GPL2')
depends=('gtk3' 'libxfce4ui' 'libxfce4util' 'xfce4-panel' 'zorin-appgrid-lite')
makedepends=('make' 'cmake' 'pkgconf')
provides=('xfce4-zorinappgridlite-plugin')
conflicts=('xfce4-zorinappgridlite-plugin')
source=("http://ppa.launchpad.net/zorinos/stable/ubuntu/pool/main/x/xfce4-zorinappgridlite-plugin/$pkgname$_ver.tar.xz")
sha1sums=('31f0cdc1146eef9f24a1f76a96d4e3ecf35cbb75')
sha256sums=('0433c97ae9bb65c3ba7f0df66653955d11491cfea58965d891b5ff43355b777a')

build() {
	cd "$pkgname"
	cmake -DCMAKE_BUILD_TYPE=release -DCMAKE_INSTALL_PREFIX=/usr .
	make -j$(nproc)
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
}
