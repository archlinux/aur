# Maintainer: William Tang <galaxyking0419@gmail.com>

pkgname=scylla-bin
pkgver=5.0.1
pkgrel=1
pkgdesc='The real-time big data database that is API-compatible with Apache Cassandra and Amazon DynamoDB'
arch=('x86_64')
url="http://www.scylladb.com/"
license=('AGPL')
provides=("scylla=$pkgver")
conflicts=('scylla')
depends=('python-distro' 'python-yaml')

source=(http://downloads.scylladb.com.s3.amazonaws.com/downloads/scylla/rpm/centos/scylladb-5.0/x86_64/{scylla-conf,scylla-kernel-conf,scylla-server}-$pkgver-0.20220719.b177dacd3.x86_64.rpm)
sha256sums=('fed1096b06cd69b1525b846322bbc9cf81c1b4fb935fa51943503d7c487c0562'
            '6184ea4e0a0e5c436ad25802dbcd730bca4159ca67af8d6e8a82217e6822b28a'
            '1c6bc41ef5d778d161aa4c86de42ee60dbec7b9339a0871b3a68a8cb8b5c9417')

options=(!strip)
install=$pkgname.install

package() {
    mv usr/sbin/* usr/bin/
    rmdir usr/sbin
    mv etc opt usr var "$pkgdir"
}
