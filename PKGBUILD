# Maintainer: William Tang <galaxyking0419@gmail.com>

pkgname=scylla-bin
pkgver=5.2.3
pkgrel=1
pkgdesc='The real-time big data database that is API-compatible with Apache Cassandra and Amazon DynamoDB'
arch=('x86_64')
url="http://www.scylladb.com/"
license=('AGPL')
provides=('scylla')
conflicts=('scylla')
depends=('python-distro' 'python-traceback-with-variables' 'python-yaml')

source=("https://downloads.scylladb.com/downloads/scylla/rpm/centos/scylladb-5.2/x86_64/{scylla-conf,scylla-kernel-conf,scylla-server}-$pkgver-0.20230608.ea08d409f155.x86_64.rpm")
sha256sums=('7a3df4cec8b463352ff9d3ae0d9989c9c1149e0e7345a1a316041cbcbc71e251'
            '0d1da5604644fc6cb09f68de7cf7162269edfe9643da612cb7a1245baa5b6109'
            '9178993d03fbc9cf0bdc220cbdfdf38a7fd09e6839635e0a7b86859816be0716')

options=(!strip)
install=$pkgname.install

package() {
    mv usr/sbin/* usr/bin/
    rmdir usr/sbin
    mv etc opt usr var "$pkgdir"
}
