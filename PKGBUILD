# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jarek Sedlacek <JarekSedlacek@gmail.com>
# Contributor: Erdbeerkaese <erdbeerkaese underscore arch at gmail dot com>

pkgname=sparkleshare
pkgver=1.0.0
pkgrel=1
pkgdesc="Collaboration and sharing tool based on git written in C Sharp"
arch=('any')
url="http://sparkleshare.org/"
license=('GPL3')
depends=('webkit-sharp' 'notify-sharp' 'curl' 'git' 'openssh' 'desktop-file-utils' 'hicolor-icon-theme' 'xdg-utils')
makedepends=('intltool' 'gnome-doc-utils')
install=$pkgname.install
source=(https://github.com/downloads/hbons/SparkleShare/$pkgname-linux-$pkgver.tar.gz)
md5sums=('1f43c873e220a8a8f28ee46b33e4ca19')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-appindicator
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
