# Contributor: Caleb Maclennan <caleb@alerque.com>
pkgname=cups-xerox-phaser-6500
pkgver=1.0.0
pkgrel=1
_rpmname=Xerox-Phaser-6500-Linux.rpm
pkgdesc="CUPS driver for the Xerox Phaser 6500 series"
url="http://www.support.xerox.com/support/phaser-6500/downloads/engb.html?operatingSystem=linux&fileLanguage=en_GB"
license=('custom')
arch=('i686' 'x86_64')
depends=('cups')
makedepends=('rpmextract' 'libtool')
source=(http://download.support.xerox.com/pub/drivers/6500/drivers/linux/en_GB/Xerox-Phaser-6500-Linux.rpm)
md5sums=('aad7730c2a9f7f755d66cb477d8f732a')

build() {
  cd ${srcdir}
  rpmextract.sh ${_rpmname} || return 1
}

package() {
  cd ${srcdir}
  cp -r usr ${pkgdir}
}

