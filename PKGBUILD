# Maintainer: aulonsal <aulonsal at gmail dot com>
pkgname=dbgate-bin
pkgver=4.2.0
pkgrel=1
pkgdesc="Database manager for MySQL, PostgreSQL, SQL Server and MongoDB."
arch=(x86_64)
url="https://github.com/${pkgname%-bin}/${pkgname%-bin}"
license=('MIT')
depends=(
	nss
	gtk3
)
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
source=(
	"$pkgname-$pkgver.deb::$url/releases/download/v$pkgver/dbgate-linux-$pkgver.deb"
	"$pkgname-$pkgver-LICENSE::${url/github/raw.githubusercontent}/master/LICENSE"
)

b2sums=('0144d11bd28daf602cc08d37a4f8dc21a5404dbbdda07aad519f8ffe4f408358325fb55f503d84989664be62aa5814073b0e749b86fb45282f77357d589e0159'
        '9cc4e2813f0978862b0960aa0c8d5b0bc75ae299f10b793ae152202f2e6f43127381c9153c6f51ca1bc83ab633d198dac5d817105a8e7b43e1aad401e0b6eb2f')

package() {
	bsdtar -xf data.tar.xz --directory="$pkgdir"
	install -Dm644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"

	# Move icon to the right directory
	mv "$pkgdir/usr/share/icons/hicolor/0x0" "$pkgdir/usr/share/icons/hicolor/256x256"
}
