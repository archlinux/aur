# Maintainer: Florian Heyer <florian.heyer@gmx.de>

pkgname=backup2l
pkgver=1.5
pkgrel=2
pkgdesc="Low-maintenance backup/restore tool"
arch=('i686' 'x86_64')
url="http://backup2l.sourceforge.net/"
license=('GPL')
depends=('awk' 'bash' 'findutils' 'grep' 'gzip' 'sed')
optdepends=('bzip2' 'openssl')
source=('http://downloads.sourceforge.net/backup2l/backup2l_1.5.tar.gz')
md5sums=('464dc8cddf172bc44ed6ce64564a83fb')

build() {
  cd $srcdir/$pkgname-$pkgver
  patch < ../../install-sh.patch
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -d ${pkgdir}/etc/cron.daily
  ./install-sh -fc ${pkgdir}/usr ${pkgdir}/usr/bin ${pkgdir}/etc
}

