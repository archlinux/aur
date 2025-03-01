# Maintainer: William Tang <ttc0419@outlook.com>

pkgname=scylla-bin
pkgver=6.2.3
pkgrel=1
pkgdesc='The real-time big data database that is API-compatible with Apache Cassandra and Amazon DynamoDB'
arch=('x86_64')
url="http://www.scylladb.com/"
license=('AGPL')
provides=('scylla')
conflicts=('scylla')
depends=('python-distro' 'python-traceback-with-variables' 'python-yaml')

source=(https://downloads.scylladb.com/downloads/scylla/rpm/centos/scylladb-6.2/x86_64/scylla-{conf,kernel-conf,server}-$pkgver-0.20250119.bff9ddde1283.x86_64.rpm)
sha256sums=(
	'76be8b50d4b984d1f1ce8d3c138f6405c1b0f51245d27161d2f7e9b881fb2401'
	'405742f8f298170fa19024c06fc209b5418e2799376ed5e362953ea63480eba2'
	'81cf645e669ac569ca6446d0414c54a95c7d1fd380872b91523bae10450cd7c1'
)

options=('!strip')
install=$pkgname.install

package() {
	mv usr/sbin/* usr/bin/
	rmdir usr/sbin
	mv etc opt usr var "$pkgdir"
}
