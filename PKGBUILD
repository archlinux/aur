# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Andy Massimino <mass at gmx dot se>
# Contributor: pancho horrillo <pancho at pancho dot name>
# Contributor: Ray Hogenson <rayhogenson at gmail dot com>

pkgname=par
pkgver=1.53
pkgrel=1
pkgdesc='Paragraph reformatter'
url='http://www.nicemice.net/par/'
depends=('glibc')
arch=('x86_64' 'i686' 'aarch64' 'arm7h' 'arm6h' 'arm')
license=('custom')
source=("$pkgname-$pkgver.tar.gz::http://www.nicemice.net/par/Par-1.53.0.tar.gz")
sha512sums=('3f8ac57fe19ebcf427b11f4d79f2c5cc9286c1439c38a53d45bd29b9219369db2798efbd0e203ac359d59ebbdd3ead1c50ae75352a1ffc568d4d3b9ad50642b1')
_dirname='Par-1.53.0'

build() {
	cd "$_dirname"
	make -f protoMakefile CC="cc $CFLAGS -std=c99 -D_GNU_SOURCE -c" LINK1="cc $LDFLAGS"
}

package() {
	cd "$_dirname"
	install -Dm755 -D par		"$pkgdir/usr/bin/par"
	install -Dm644 -D par.1		"$pkgdir/usr/share/man/man1/par.1"
	install -Dm644 -D par.doc	"$pkgdir/usr/share/licenses/$pkgname/par.doc"
}
