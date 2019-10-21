pkgname=goiardi
pkgver=0.11.10
pkgrel=1
pkgdesc="A Chef server written in Go, able to run entirely in memory, with optional persistence with saving the in-memory data to disk or using MySQL or Postgres as the data storage backend"
arch=('x86_64')
license=('Apache 2.0')
url="http://goiardi.gl/"
source=(
	https://github.com/ctdk/goiardi/releases/download/v$pkgver/goiardi-$pkgver-linux-amd64
	goiardi.service
	)

md5sums=('1c9643e0e1486b7fba8b9441c0283f37'
	 'SKIP'
	)

package() {
	cd $srcdir
	install -D -m755 $srcdir/goiardi-$pkgver-linux-amd64  $pkgdir/usr/bin/goiardi
	install -D -m644 "${srcdir}/goiardi.service" "${pkgdir}/usr/lib/systemd/system/goiardi.service"
}
