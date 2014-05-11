# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jarek Sedlacek <JarekSedlacek@gmail.com>
# Contributor: Erdbeerkaese <erdbeerkaese underscore arch at gmail dot com>

pkgname=sparkleshare
pkgver=1.4
pkgrel=1
pkgdesc="Collaboration and sharing tool based on git written in C Sharp"
arch=('any')
url="http://sparkleshare.org/"
license=('GPL3')
depends=('webkitgtk-sharp' 'notify-sharp-3' 'curl' 'git' 'openssh' 'desktop-file-utils')
install=$pkgname.install
source=(https://bitbucket.org/hbons/sparkleshare/downloads/$pkgname-linux-$pkgver.tar.gz)
md5sums=('66ae2b680d723f7a8b38e184d3b3dc55')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
