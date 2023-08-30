# Maintainer: raf <raf at raf dot org>
pkgname=mved-og
pkgver=3.0
pkgrel=1
pkgdesc="(mved) Carefully rename multiple files and directories"
arch=("any")
url=https://raf.org/mved/
license=("GPL")
depends=("perl>=5.6")
conflicts=("mved")
source=("$pkgname-$pkgver.tar.gz::https://github.com/raforg/mved/releases/download/v$pkgver/mved-$pkgver.tar.gz")
sha256sums=("f8e01e9fee847e01cd2ee3a7e621c97e49c8f7c52e472b3efacfeb1029a5ff31")

check()
{
	cd "mved-$pkgver"
	make test
}

package()
{
	cd "mved-$pkgver"
	make PREFIX="$pkgdir"/usr MANDIR="$pkgdir"/usr/share/man/man1 install
}

