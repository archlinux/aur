# Maintainer: Jan Dolinar <dolik.rce@gmail.com>
# Contributor: Andre Klitzing <andre () incubo () de>
pkgname=dput
pkgver=0.9.6.4
pkgrel=1
pkgdesc="Debian package upload tool"
arch=('any')
url="http://packages.qa.debian.org/dput"
license=('GPL')
depends=('python2' 'gnupg')
source=(http://ftp.debian.org/debian/pool/main/d/${pkgname}/${pkgname}_${pkgver}_all.deb)
sha256sums=('2ac0bcf25c3e64728fdbec3c91c16b305b982861e60780ecadff3b97c90bfa8a')

package() {
  ar x ${pkgname}_${pkgver}_all.deb
  tar xzf data.tar.gz -C "$pkgdir/"
  cd "$pkgdir"
  sed -i -e '1s|^#!/usr/bin/python$|#!/usr/bin/python2|' $pkgdir/usr/bin/d{c,p}ut
}
