pkgname=goiardi
pkgver=0.11.8
pkgrel=1
pkgdesc="A Chef server written in Go, able to run entirely in memory, with optional persistence with saving the in-memory data to disk or using MySQL or Postgres as the data storage backend"
arch=('x86_64')
license=('Apache 2.0')
url="http://goiardi.gl/"
source=(
	https://github.com/ctdk/goiardi/releases/download/v$pkgver/goiardi-$pkgver-linux-amd64
	goiardi.service
	)

md5sums=('0acf4140b0dfc80e7df88181b0c60b30'
	 'SKIP'
	)

package() {
	cd $srcdir
	install -D -m755 $srcdir/goiardi-$pkgver-linux-amd64  $pkgdir/usr/bin/goiardi
	install -D -m644 "${srcdir}/goiardi.service" "${pkgdir}/usr/lib/systemd/system/goiardi.service"
}
