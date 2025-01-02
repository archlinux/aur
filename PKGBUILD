# Maintainer: bluetail <a minus development plus archpkg at posteo dot de>
# Maintainer: éclairevoyant

_pkgname=btdu
pkgname="$_pkgname-bin"
pkgver=0.6.0
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
sha256sums=('2474991807ccb9bb577953e290f3c79c6032170305c535016b77b3e1107c3d1f')
sha256sums_x86_64=('35b9bb752e6aa902b8281e92a5411b2f1cfb9fa251089adf909dc95efc011c48')
sha256sums_aarch64=('6a3bc73af7756f116ff99cfe20e8e728e2eb16c7da87d53f20e17e55c5b5b073')

package() {
	install -D -m+x $pkgname-$pkgver-$CARCH "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 $pkgname-$pkgver.man1 "$pkgdir/usr/share/man/man1/$_pkgname.1"
}
