#Maintainer: MrJavum <mrjavum [at] gmail [dot] com>

pkgname=xerox-phaser-6020
_rel=25
pkgver=1.0
pkgrel=1
pkgdesc="Xerox Phaser 6020 color laser printer CUPS driver"
url="https://www.support.xerox.com/support/phaser-6020/downloads/"
arch=('i686' 'x86_64')
license=('custom')
depends=('cups')
depends_i686=('glibc' 'libcups' 'gnutls' 'zlib' 'p11-kit' 'gcc-libs' 'libtasn1' 'nettle' 'gmp' 'libffi')
depends_x86_64=("${depends_i686[@]/#/lib32-}")
makedepends=('unzip' 'binutils')
source=("http://download.support.xerox.com/pub/drivers/6020/drivers/linux/pt_BR/${pkgname}_${pkgver}-${_rel}.zip")
sha256sums=('15cacf4d932c24b2a6ce0d127bac046c7e09307ed9a87045df20a7dd4bae8937')

if [ "$arch" == "x86_64" ]; then
  _arch="amd64"
else
  _arch="i386"
fi

package() {
  cd "$srcdir"
  ar xv ${pkgname}_${pkgver}-${_rel}_${_arch}.deb
  tar xzf data.tar.gz -C .
  cp -r usr "$pkgdir"
}
