# Maintainer: bluetail <a minus development plus archpkg at posteo dot de>
# Maintainer: éclairevoyant

_pkgname=btdu
pkgname="$_pkgname-bin"
pkgver=0.5.1
pkgrel=2
pkgdesc="Sampling disk usage profiler for btrfs"
arch=('x86_64' 'aarch64')
url="https://github.com/CyberShadow/$_pkgname"
license=('GPL2')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$pkgname-$pkgver.man1::$url/raw/v$pkgver/btdu.1")
source_x86_64=("$pkgname-$pkgver-x86_64::$url/releases/download/v$pkgver/btdu-static-x86_64")
source_aarch64=("$pkgname-$pkgver-aarch64::$url/releases/download/v$pkgver/btdu-glibc-aarch64")
sha256sums=('835e9a817b9ab11e2802cbf07e73aa0c8caf85c249fc211b4c03790c45cb91e0')
sha256sums_x86_64=('aea4b88e59990e37bf7fb3568919e6c41e510840375ca1adfd981ebbcbea608d')
sha256sums_aarch64=('cd9ae768a305514e80b9f64723f0ee8dc690e8a92f50b5826fbb7fa3a05e9ae0')

package() {
	install -D -m+x $pkgname-$pkgver-$arch "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 $pkgname-$pkgver.man1 "$pkgdir/usr/share/man/man1/$_pkgname.1"
}
