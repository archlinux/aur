# Maintainer: Liqueur Librazy <im@librazy.org>
pkgname=tidb-bin
pkgver=0.0.1.rc1
pkgrel=1

pkgdesc="A distributed NewSQL database compatible with MySQL protocol"
arch=('x86_64')
url="https://github.com/pingcap/tidb"
license=('APACHE')
depends=('gcc-libs')
conflict=('tidb-bin-nightly')
backup=()
options=()
source=("http://download.pingcap.org/tidb-rc1-linux-amd64.tar.gz")

sha256sums=(
	'5c665b9ca5e75a5baae744518fe20e586860dbdc8eca9d78104ba0c682fcc17c')

package() {
	install -dm755 "$pkgdir"/{opt/tidb/conf,usr/bin}
	cd "tidb-rc1-linux-amd64/bin"
	install -D -m755 *-server "${pkgdir}/usr/bin"
	cd ..
	cp -R conf "$pkgdir/opt/tidb/"
	cd ..
}
