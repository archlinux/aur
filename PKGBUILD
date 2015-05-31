# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=backup-gmail
pkgver=0.1.2.1
pkgrel=2
pkgdesc="CLI and GUI interface to backup and restore Gmail data via IMAP"
arch=('any')
url="https://launchpad.net/backup-gmail"
license=('GPL3')
depends=('python2')
optdepends=('python2-pyside: GUI')
source=(http://launchpad.net/backup-gmail/trunk/backup-gmail-0.1/+download/$pkgname-$pkgver.tar.gz)
md5sums=('3e4290ca08119445426633693638943d')

build() {
  cd "$srcdir/$pkgname"
  sed -i 's|^#!/usr/bin/python|&2|' *.py
}

package() {
  cd "$srcdir/$pkgname"
  install -d -m755 "$pkgdir"/usr/bin
  install -m755 backup_gmail.py "$pkgdir"/usr/bin/backup_gmail.py
  install -m755 gui.py "$pkgdir"/usr/bin/backup_gmail_gui
}

# vim:set ts=2 sw=2 et:
