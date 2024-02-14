# Maintainer: William Tang <ttc0419@outlook.com>

pkgname=scylla-bin
pkgver=5.4.3
pkgrel=1
pkgdesc='The real-time big data database that is API-compatible with Apache Cassandra and Amazon DynamoDB'
arch=('x86_64')
url="http://www.scylladb.com/"
license=('AGPL')
provides=('scylla')
conflicts=('scylla')
depends=('python-distro' 'python-traceback-with-variables' 'python-yaml')

source=(https://downloads.scylladb.com/downloads/scylla/rpm/centos/scylladb-5.4/x86_64/scylla-{conf,kernel-conf,server}-$pkgver-0.20240211.cf42ca0c2a65.x86_64.rpm)
sha256sums=(
	'3d0283324196fe808da595607f8375b7b225b6ac56773ea1aba0f7fc50efdfd9'
	'ead89ecc4656d694987aeaac8dcd4b6d121a83d65014e9169be98bc52619a847'
	'd9ce59d947a3013199d3a5688c2c455c31bc211c38b2bac7cddda5bda6a617e5'
)

options=('!strip')
install=$pkgname.install

package() {
	mv usr/sbin/* usr/bin/
	rmdir usr/sbin
	mv etc opt usr var "$pkgdir"
}
