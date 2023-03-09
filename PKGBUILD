# Maintainer: Cristian Gutierrez <cristian@crstian.me>

pkgname="mow-git"
pkgver=v0.2
pkgrel=1
pkgdesc="Cross platform CLI tool for Glorious Model O Wireless"
arch=('any')
url="https://github.com/korkje/mow"
makedepends=('cargo' 'git' 'libusb')
provides=('mow')
source=('git+https://github.com/korkje/mow.git')
md5sums=('SKIP')


build() {
  cd $srcdir/mow/;
  cargo build \
    --release \
	-vv;
}

package() {
  install \
    -Dm755 \
	$srcdir/${pkgname//-git}/target/release/${pkgname//-git} \
	$pkgdir/usr/bin/${pkgname//-git};
}
