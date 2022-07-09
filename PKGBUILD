# Simple NEtwork Backup Utility/Systems Nominal, Everything's Backed Up
# Maintainer: Dian M Fay <dian dot m dot fay at gmail dot com>
# Contributor: Derek Pressnall <dspgh at needcaffeine dot net> (developer/original uploader)
pkgname=snebu
pkgver=1.1.2
pkgrel=2
pkgdesc="A snapshot style multiple-client backup program"
url="https://www.snebu.com"
license=("GPL3")
depends=("sqlite" "bash" "lzo" "openssl")
arch=("i686" "x86_64")
backup=("etc/snebu.conf")
source=("https://github.com/derekp7/snebu/archive/v1.1.2.tar.gz")
md5sums=('e929cd899bb4e1aec734bd6db5786524')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make install DESTDIR="${pkgdir}" PREFIX=/usr
}
