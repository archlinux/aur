# Maintainer: F. Miñano <cicely@algofacil.info>
pkgname=mindi-busybox
pkgver=1.18.5
pkgrel=2
pkgdesc="This package provides a busybox version suited for Mindi"
arch=('i686' 'x86_64')
url="http://www.mondorescue.org/"
license=('GPL')
depends=(gcc)
changelog=ChangeLog

#There are two official mirrors. If one is not working try the other. The muskokamug.org seems faster.
source=(ftp://ftp.mondorescue.org/src/mindi-busybox-1.18.5.tar.gz)
#source=(http://mondorescue.muskokamug.org/src/$pkgname-$pkgver.tar.gz)
md5sums=('0668d3bba33989dbaab3f84771578438')         
#	'ec7280e7573eb12cbb9cc6707468ef01')

package() {
  cd "$srcdir/$pkgname-$pkgver"
#  patch -p1 < ../shell_common.patch
  make oldconfig || return 1
  make busybox || return 1
  make CONFIG_PREFIX=$pkgdir/usr/lib/mindi/rootfs install
}

# vim:set ts=2 sw=2 et:
