# Maintainer: jjacky
pkgname=auto-rsync-backups
pkgver=0.2
pkgrel=1
pkgdesc="little script to handle/rotate rsync backups"
arch=('any')
url="https://bitbucket.org/jjacky/backups"
license=('GPL3')
depends=('bash' 'rsync')
install='install'
source=(https://bitbucket.org/jjacky/backups/get/$pkgver.tar.gz)

package() {
  cd "$srcdir/jjacky-backups-$pkgver/src"
  install -D -m755 backups.sh "${pkgdir}/usr/bin/backups.sh"
  install -D -m755 restore.sh "${pkgdir}/usr/bin/restore.sh"
  install -D -m644 backups.common "${pkgdir}/usr/bin/backups.common"
  install -D -m644 backups.sample.conf "${pkgdir}/usr/share/${pkgname}/backups.conf"
  install -D -m644 backups.excludes "${pkgdir}/usr/share/${pkgname}/backups.excludes"
}

md5sums=('013edc9f160098e27bd94b9ec754c7e7')
