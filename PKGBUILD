# Contributor: Michal Soltys <soltys@ziu.info>

pkgname=nuttcp
pkgver=6.1.2
pkgrel=1
pkgdesc="TCP/UDP network testing tool - simple, easy to use, with interesting feature set."
arch=(i686 x86_64)
url="http://www.lcp.nrl.navy.mil/nuttcp/"
license=('GPL')
depends=('glibc')
install=nuttcp.install
source=(
	ftp://ftp.lcp.nrl.navy.mil/pub/nuttcp/$pkgname-$pkgver.tar.bz2
)
build() {
  cd "$startdir/src/$pkgname-$pkgver"
  make || return 1;
  gzip -c $pkgname.8 >$pkgname.8.gz
  install -D -m0644 -o0 -g0 $pkgname.8.gz $startdir/pkg/usr/share/man/man8/$pkgname.8.gz
  install -D -m0755 -o0 -g0 $pkgname-$pkgver $startdir/pkg/usr/sbin/$pkgname
}
md5sums=('a16d4d6d5def02cea980e57feaf30500')
