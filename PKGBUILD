# Maintainer: aulonsal <aulonsal at gmail dot com>
pkgname=dbgate-bin
pkgver=4.8.0
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

b2sums=('9ea0436798e320984b7d0c43bdb0dc1edf00c2874ec3ce851214f9c9f1facdd938391e875935a01b779396e08b95265b822e4e33d31126da47d681d10930fb70'
        '9cc4e2813f0978862b0960aa0c8d5b0bc75ae299f10b793ae152202f2e6f43127381c9153c6f51ca1bc83ab633d198dac5d817105a8e7b43e1aad401e0b6eb2f')

package() {
	bsdtar -xf data.tar.xz --directory="$pkgdir"
	install -Dm644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
