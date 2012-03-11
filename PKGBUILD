# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Macfly <mmacfly@gmail.com>
# Contributor: Duncan Ferguson <duncan_ferguson@users.sourceforge.net>

pkgname=clusterssh
pkgver=3.28
pkgrel=3
pkgdesc="Cluster SSH opens terminal windows with connections to specified hosts and an administration console."
arch=('i686' 'x86_64')
url="http://clusterssh.sourceforge.net/"
license=('GPL')
depends=('perl-tk' 'perl-x11-protocol' 'xterm')
source=(http://downloads.sourceforge.net/project/$pkgname/1.%20ClusterSSH%20Series%203/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('11e012329d2c62e1f7b17f3ac517769a')

build() {
  cd ${srcdir}/$pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/$pkgname-$pkgver

  make DESTDIR=${pkgdir} install
}
