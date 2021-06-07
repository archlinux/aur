# Maintainer: aulonsal <aulonsal at gmail dot com>
pkgname=dbgate-bin
pkgver=4.2.4
pkgrel=1
pkgdesc="Database manager for MySQL, PostgreSQL, SQL Server, MongoDB, SQLite and others"
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

b2sums=('f9f41479ae65e1197eabccc3ac59b2e003ae0e064f92ae92c4931b0a7d4d349696f166c2307c6ef3406e786b87142b38e65f89770d6452313d0b3ef33f8ab9d4'
        '9cc4e2813f0978862b0960aa0c8d5b0bc75ae299f10b793ae152202f2e6f43127381c9153c6f51ca1bc83ab633d198dac5d817105a8e7b43e1aad401e0b6eb2f')

package() {
	bsdtar -xf data.tar.xz --directory="$pkgdir"
	install -Dm644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	# Move icon to the right directory
	mv "$pkgdir/usr/share/icons/hicolor/0x0" "$pkgdir/usr/share/icons/hicolor/256x256"
}
