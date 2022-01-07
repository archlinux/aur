# Maintainer: aulonsal <aulonsal at gmail dot com>
pkgname=dbgate-bin
pkgver=4.5.1
pkgrel=1
pkgdesc='Database manager for MySQL, PostgreSQL, SQL Server, MongoDB, SQLite and others'
arch=('x86_64')
url="https://github.com/${pkgname%-bin}/${pkgname%-bin}"
license=('MIT')
depends=(
	nss
	gtk3
)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=(
	"$pkgname-$pkgver.deb::$url/releases/download/v$pkgver/dbgate-$pkgver-linux_amd64.deb"
	"$pkgname-$pkgver-LICENSE::${url/github/raw.githubusercontent}/v$pkgver/LICENSE"
)

b2sums=('4c2b76d043766c93e456ca38e267c5f8ebf58d447a8ca8b377d1cecf5a5dd32db635f76274da533fcc4502b0874cdba59b81dd2eafe0efce6bcd6f40a7eadfbc'
        '9cc4e2813f0978862b0960aa0c8d5b0bc75ae299f10b793ae152202f2e6f43127381c9153c6f51ca1bc83ab633d198dac5d817105a8e7b43e1aad401e0b6eb2f')

package() {
	bsdtar -xf data.tar.xz --directory="$pkgdir"
	install -Dm644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
