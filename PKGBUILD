# Maintainer: aulonsal <aulonsal at gmail dot com>
pkgname=dbgate-bin
pkgver=4.2.3
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
	"$pkgname-$pkgver.deb::$url/releases/download/v$pkgver/dbgate-$pkgver-linux_amd64.deb"
	"$pkgname-$pkgver-LICENSE::${url/github/raw.githubusercontent}/master/LICENSE"
)

b2sums=('cfeb77dfb48dd15eda20e15a90bf5cfde3bdb74491d1012f46de591403cfe4fd4827f25e04dd5d0bf0e881b6ef1b6eacc11652480bb2d4f43c820e1117014977'
        '9cc4e2813f0978862b0960aa0c8d5b0bc75ae299f10b793ae152202f2e6f43127381c9153c6f51ca1bc83ab633d198dac5d817105a8e7b43e1aad401e0b6eb2f')

package() {
	bsdtar -xf data.tar.xz --directory="$pkgdir"
	install -Dm644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"

	# Move icon to the right directory
	mv "$pkgdir/usr/share/icons/hicolor/0x0" "$pkgdir/usr/share/icons/hicolor/256x256"
}
