pkgname=zerofs-bin
pkgver=0.15.2
pkgrel=1
pkgdesc="ZeroFS - The Filesystem That Makes S3 your Primary Storage. ZeroFS is 9P/NFS/NBD on top of S3."
arch=('x86_64' 'aarch64')
url="https://github.com/Barre/ZeroFS"
conflicts=('zerofs' 'zerofs-git')
license=('AGPLv3')

source=("https://github.com/Barre/ZeroFS/releases/download/v$pkgver/zerofs-pgo-multiplatform.tar.gz")
sha256sums=('240faeabb6f15800a8d5d8b3633fde1c35558f1fb88a18dc102b0049f416f2c7')

package() {
	case $arch in
		x86_64)
			_carch=amd64
			;;
		*)
			;;
	esac
	msg "Using zerofs-linux-$_carch-pgo"
	install -D -m 0655 -o root -g root $srcdir/zerofs-linux-$_carch-pgo $pkgdir/usr/bin/zerofs	
}
