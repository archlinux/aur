# Maintainer: Tom Moore <tmoore01@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Cedric Girard <girard.cedric@gmail.com>
pkgname=lib32-proxychains-ng
pkgver=4.14
pkgrel=1
pkgdesc="A hook preloader that allows to redirect TCP traffic of existing dynamically linked programs through one or more SOCKS or HTTP proxies (32-bit version)"
arch=('x86_64')
url="https://github.com/rofl0r/proxychains"
license=('GPL')
provides=('lib32-proxychains')
replaces=('lib32-proxychains')
conflicts=('lib32-proxychains')
depends=('glibc' 'proxychains-ng' 'lib32-gcc-libs')
source=("http://ftp.barfooze.de/pub/sabotage/tarballs/proxychains-ng-$pkgver.tar.xz")
sha256sums=('9d00e035b8a808b9e0c750501b08f38eeadd0be421f30ee83e88fd15e872b0ae')
build() {
cd proxychains-ng-$pkgver
export CFLAGS=-m32 LDFLAGS=-m32
./configure --prefix=/usr --sysconfdir=/etc
make
}
package() {
cd proxychains-ng-$pkgver
install -Dm0755 libproxychains4.so "$pkgdir/usr/lib32/libproxychains4.so"
}
# vim:set ts=2 sw=2 et:
