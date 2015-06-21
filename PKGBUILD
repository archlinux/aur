# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=discspan
pkgver=0.2.2
pkgrel=2
pkgdesc="Backup a directory of files to multiple DVDs on the Linux platform"
arch=('any')
url="http://sourceforge.net/projects/discspan/"
license=('GPL2')
depends=('dbus-python' 'cdrkit')
backup=('etc/discspan.ini')
source=(http://downloads.sourceforge.net/project/discspan/discspan/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('afc1c616746b52277a2f997b1772bfaf')

package() {
  cd "$srcdir/$pkgname-$pkgver"
 
  install -D -m644 discspan.ini "$pkgdir"/etc/discspan.ini
  sed -i 's|\(/usr/bin/env\ \)python|\1python2|' discspan.py
  install -D -m755 discspan.py "$pkgdir"/usr/bin/discspan
}

# vim:set ts=2 sw=2 et:
