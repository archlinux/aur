# Maintainer: Rene Hahne <rehahne@gmail.com>
# Contributor: jens-na <me at jens-na dot de>
# Contributor: linx56
pkgname=storebackup
pkgver=3.5
pkgrel=3
pkgdesc="A backup utility that stores files on other disks"
arch=('any')
url="http://savannah.nongnu.org/projects/storebackup"
license=('GPL3')
depends=('perl' 'util-linux')
source=(http://download.savannah.gnu.org/releases/storebackup/storeBackup-$pkgver.tar.bz2)
md5sums=('07881dfea171142009d0ac70d7dac479')

package() {
  cd "$srcdir/storeBackup"
  install -dm755 "$pkgdir/usr/share"
  mv bin lib "$pkgdir/usr/"
  mv man "$pkgdir/usr/share/"

  # fix permissions
  find "$pkgdir/usr/" -type d -exec chmod 755 {} +
  find "$pkgdir/usr/bin/" -type f -exec chmod 755 {} +
  find "$pkgdir/usr/lib/" -type f -exec chmod 755 {} +
  find "$pkgdir/usr/share/man" -type f -exec chmod 644 {} +
}

# vim:set ts=2 sw=2 et: 
