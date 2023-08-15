# Maintainer: William Tang <galaxyking0419@gmail.com>

pkgname=scylla-bin
pkgver=5.2.6
pkgrel=1
pkgdesc='The real-time big data database that is API-compatible with Apache Cassandra and Amazon DynamoDB'
arch=('x86_64')
url="http://www.scylladb.com/"
license=('AGPL')
provides=('scylla')
conflicts=('scylla')
depends=('python-distro' 'python-traceback-with-variables' 'python-yaml')

source=(https://downloads.scylladb.com/downloads/scylla/rpm/centos/scylladb-5.2/x86_64/{scylla-conf,scylla-kernel-conf,scylla-server}-5.2.6-0.20230730.58acf071bf28.x86_64.rpm)
sha256sums=('9c945e9849ed6e65730476751e1d6f10f6714f98fb60d531ab8e5d7077abd687'
            '3ecd329008d172065e7e31d758d417df08471628e6d1c8c8b8e1e6ff3cee46c6'
            'c73fb2b6a482ad992edb41b1c305621d4f5c175aa5f617a5dc786759137f74e4')

options=(!strip)
install=$pkgname.install

package() {
    mv usr/sbin/* usr/bin/
    rmdir usr/sbin
    mv etc opt usr var "$pkgdir"
}
