# Maintainer: aulonsal <aulonsal at gmail dot com>
pkgname=dbgate-bin
pkgver=4.4.1
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

b2sums=('8965103cf0c368b454b3bb5d1ce65e9b082c3d515e18125d4b6492db3b3b5b390917e7238dfa495133a4d247eee5510a695cc4c5bac19cfbc93036dc7a8a6dd4'
        '9cc4e2813f0978862b0960aa0c8d5b0bc75ae299f10b793ae152202f2e6f43127381c9153c6f51ca1bc83ab633d198dac5d817105a8e7b43e1aad401e0b6eb2f')

package() {
	bsdtar -xf data.tar.xz --directory="$pkgdir"
	install -Dm644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
