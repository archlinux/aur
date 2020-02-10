# Contributor: Caleb Maclennan <caleb@alerque.com>
pkgname=cups-xerox-phaser-6500
pkgver=1.0.0
pkgrel=1
_rpmname=Xerox-Phaser-6500-Linux.rpm
pkgdesc='CUPS driver for the Xerox Phaser 6500 series'
url='https://www.support.xerox.com/support/phaser-6500/downloads/engb.html?operatingSystem=linux&fileLanguage=en_GB'
license=('custom')
arch=('i686' 'x86_64')
depends=('cups')
makedepends=('rpmextract' 'libtool')
source=('http://download.support.xerox.com/pub/drivers/6500/drivers/linux/en_GB/Xerox-Phaser-6500-Linux.rpm')
sha256sums=('29b46cd1e57463ad4adcfa507bdaecd9fcdbda50fdb4cb34f53164af45dbebcb')

build() {
  cd "$srcdir"
  rpmextract.sh "$_rpmname" || return 1
}

package() {
  cd "$srcdir"
  cp -r usr "$pkgdir"
}

