# Maintainer: Soma Zambelly <zambelly.soma@gmail.com>

pkgname=xerox-workcentre-6027
pkgver=1.0
pkgrel=22
pkgdesc="Xerox Workcentre 6027 color laser printer CUPS driver"
url="https://www.support.xerox.com/en-us/product/workcentre-6027/downloads?platform=linux"
arch=('i686' 'x86_64')
license=('custom')
depends=('cups')
depends_i686=('glibc' 'libcups' 'gnutls' 'zlib' 'p11-kit' 'gcc-libs' 'libtasn1' 'nettle' 'gmp' 'libffi')
depends_x86_64=("${depends_i686[@]/#/lib32-}")
makedepends=('unzip' 'binutils')
source=("https://download.support.xerox.com/pub/drivers/WC6027/drivers/linux/pt_BR/${pkgname}_${pkgver}-${pkgrel}_all.zip")
sha256sums=('b7dd1ef446b692b211b2673d3aa650aa2e7932d14a18d2aa9c113cf6c28f19a5')

package() {
  cd "$srcdir"
  ar xv ${pkgname}_${pkgver}-${pkgrel}_all.deb
  tar xzf data.tar.gz -C .
  cp -r usr "$pkgdir"
}
