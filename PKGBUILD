# Maintainer: bluetail <a minus development plus archpkg at posteo dot de>
# Maintainer: éclairevoyant

_pkgname=btdu
pkgname="$_pkgname-bin"
pkgver=0.6.1
pkgrel=1
pkgdesc="Sampling disk usage profiler for btrfs"
arch=('x86_64' 'aarch64')
url="https://github.com/CyberShadow/$_pkgname"
license=('GPL2')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$pkgname-$pkgver.man1::$url/raw/v$pkgver/btdu.1")
source_x86_64=("$pkgname-$pkgver-x86_64::$url/releases/download/v$pkgver/btdu-static-x86_64")
source_aarch64=("$pkgname-$pkgver-aarch64::$url/releases/download/v$pkgver/btdu-glibc-aarch64")
sha256sums=('9d490321c58b3fe08f60cb689bca82a21809eb35f71a4ea36d08df6868be98ef')
sha256sums_x86_64=('f2200953906a0b3a83acf9dedec06b0ea46e98fb99620647212b33ce68fd1edd')
sha256sums_aarch64=('97dd2d12850588df8d8bde0d2d47f8a5c6ebcaa16e222fa78827e925cc849d2d')

package() {
	install -D -m+x $pkgname-$pkgver-$CARCH "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 $pkgname-$pkgver.man1 "$pkgdir/usr/share/man/man1/$_pkgname.1"
}
