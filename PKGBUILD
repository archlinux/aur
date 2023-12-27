# Maintainer: steeltitanium <steeltitanium1 at gmail dot com>
# Contributor: X0rg

pkgname=obs-service-recompress
pkgver=0.5.2
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
sha512sums=('6450e53dcc915c9c1e1019ab748e9ac42defc890fa6fdc9906c5ffde5e5bd40a3cdef555460df2071a27de12019c3e1e625cf86a95c3a20e5eb4c480cc5f01ac')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make PREFIX="/usr" DESTDIR="$pkgdir" install
}
