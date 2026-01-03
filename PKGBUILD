# Maintainer: bluetail <a minus development plus archpkg at posteo dot de>
# Maintainer: éclairevoyant

_pkgname=btdu
pkgname="$_pkgname-bin"
pkgver=0.7.1
pkgrel=1
pkgdesc="Sampling disk usage profiler for btrfs"
arch=('x86_64' 'aarch64')
url="https://github.com/CyberShadow/$_pkgname"
license=('GPL2')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$pkgname-$pkgver.man1::$url/raw/v$pkgver/btdu.1")
source_x86_64=("$pkgname-$pkgver-x86_64::$url/releases/download/v$pkgver/btdu-static-x86_64")
source_aarch64=("$pkgname-$pkgver-aarch64::$url/releases/download/v$pkgver/btdu-static-aarch64")
sha256sums=('7f9c99c122232221e7c5cef4f8a8ad95a1cd50182b82f4e8065c0d5d36b893dc')
sha256sums_x86_64=('8056dc388e325cb57202327361aa55b168f162b228242657d716fb201d3ba000')
sha256sums_aarch64=('1c9530415700542db85f2739b4d9c66c589da05bb685d082605051ad23adb375')

package() {
	install -D -m+x $pkgname-$pkgver-$CARCH "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 $pkgname-$pkgver.man1 "$pkgdir/usr/share/man/man1/$_pkgname.1"
}
