# Maintainer: A43 <arirera43 [at] gmail [dot] com>

pkgname="mxw-git"
pkgver=v0.1
pkgrel=1
pkgdesc="Cross platform CLI tool for Glorious Core v1 compatible wireless mice, based on mow"
arch=('any')
url="https://github.com/dkbednarczyk/mxw.git"
makedepends=('cargo' 'git' 'libusb')
provides=('mxw')
source=('git+https://github.com/dkbednarczyk/mxw.git')
md5sums=('SKIP')
options=(!lto)

build() {
  cd $srcdir/mxw/;
  cargo build --release
}

package() {
  install \
    -Dm755 \
	$srcdir/${pkgname//-git}/target/release/${pkgname//-git} \
	$pkgdir/usr/bin/${pkgname//-git};
}
