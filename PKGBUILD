# Maintainer: X0rg

pkgname=obs-service-recompress
pkgver=0.5.1
pkgrel=1
pkgdesc="Compression Service for the OpenSUSE Build Service (OBS)"
arch=('any')
url="https://github.com/openSUSE/obs-service-recompress"
license=('GPL2')
groups=('obs')
depends=('obs-build'
	'gzip'
	'bzip2'
	'xz'
	'zstd')
source=("$pkgname-$pkgver.tar.gz::https://github.com/openSUSE/obs-service-recompress/archive/$pkgver.tar.gz")
sha512sums=('d86a9a70890c90cc8c0b8ea22f9b18908bbf3533d1203ed0adbf37a166b4617646f7b1160627b2ebffef19bfb242e4945ed06009a73312d90993ea7d470c6367')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make PREFIX="/usr" DESTDIR="$pkgdir" install
}
