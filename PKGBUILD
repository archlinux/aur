# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Macfly <mmacfly@gmail.com>
# Contributor: Duncan Ferguson <duncan_ferguson@users.sourceforge.net>

pkgname=clusterssh
pkgver=3.28
pkgrel=4
pkgdesc="Cluster SSH opens terminal windows with connections to specified hosts and an administration console."
arch=('any')
url="http://clusterssh.sourceforge.net/"
license=('GPL')
depends=('perl-tk' 'perl-x11-protocol' 'xterm')
changelog=$pkgname.changelog
source=(http://downloads.sourceforge.net/project/$pkgname/1.%20ClusterSSH%20Series%203/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('27e7c0feb652d980229c5fe07f9d6bfe4eb1e3becafaf0e82a5409a9f67d8faf')

build() {
  cd ${srcdir}/$pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/$pkgname-$pkgver

  make DESTDIR=${pkgdir} install
}
