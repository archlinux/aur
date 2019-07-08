# Maintainer: Alexander Kobel <a-kobel@a-kobel.de>

pkgname=backuppcfs
pkgver=2017.06.17
pkgrel=2
pkgdesc="a fuse module to access backuppc backups through the filesystem"
arch=('any')
license=('GPL3')
depends=('backuppc' 'perl' 'perl-fuse')
source=("backuppcfs.pl.gz::https://sourceforge.net/p/backuppc/mailman/attachment/CADSzEFhwZKY6%2BZAkiPxf1SMo0_LAbeEJzPX-6Tane%3DBhuDHkeQ%40mail.gmail.com/1/")
sha256sums=('c5597791c8a3989ff765bc0698db3c5e3109fdba72c5c01735fa23152fc5bcff')

prepare () {
  cd ${srcdir}
  gzip -cd backuppcfs.pl.gz > backuppcfs.pl
}

package () {
  cd ${srcdir}
  install -D backuppcfs.pl ${pkgdir}/usr/share/backuppc/bin/backuppcfs
}
