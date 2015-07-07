# Maintainer: ultraviolet <ultravioletnanokitty@gmail.com>
# Contributor: Mark Rosenstand <mark@borkware.net>

pkgname=sysbench
pkgver=0.4.12
pkgrel=4
pkgdesc="Benchmark tool for evaluating OS parameters that are important for a system running a database under intensive load."
url="http://sysbench.sourceforge.net/"
arch=('any')
license=('GPL')
depends=('libtool' 'mariadb-clients')
makedepends=('libxslt')
source=(http://pkgs.fedoraproject.org/repo/pkgs/sysbench/sysbench-0.4.12.tar.gz/3a6d54fdd3fe002328e4458206392b9d/sysbench-0.4.12.tar.gz)
md5sums=('3a6d54fdd3fe002328e4458206392b9d')

build() {
  cd "$srcdir"/"$pkgname"-"$pkgver"
  ./configure --prefix=/usr || return 1
  cp -f /usr/bin/libtool .
  make || return 1
}

package() {
  cd "$srcdir"/"$pkgname"-"$pkgver"
  make DESTDIR=$pkgdir install || return 1

}
