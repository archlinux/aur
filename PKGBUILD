# Maintainer: Jonathan Liu <net147@gmail.com>
pkgname=imap-upload
pkgver=1.2
pkgrel=2
pkgdesc="Tool for uploading a local mbox file to IMAP4 server"
arch=('any')
url="https://imap-upload.sourceforge.net/"
license=('MIT')
depends=('python')
source=("https://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}-${pkgver}.zip")
md5sums=('bd1a0ea13e0e77707c6ac87ea5240ff2')

prepare() {
  cd "$pkgname-$pkgver"
  sed -i '1i#!/usr/bin/env python2' imap_upload.py
}

package() {
  cd "$pkgname-$pkgver"
  install -D -m 0755 imap_upload.py "${pkgdir}/usr/bin/imap_upload.py"
  install -D -m 0644 License.txt "${pkgdir}/usr/share/licenses/${pkgname}/License.txt"
}

# vim:set ts=2 sw=2 et:
