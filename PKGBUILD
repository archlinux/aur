# Maintainer: jsteel <mail at jsteel dot org>

pkgname=somagic-easycap
pkgver=1.1
pkgrel=1
pkgdesc="Linux Somagic EasyCAP DC60 and EasyCAP002 capture software"
url="http://code.google.com/p/easycap-somagic-linux"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('libusbx' 'libgcrypt')
optdepends=('somagic-easycap-tools: to extract the firmware')
source=(http://easycap-somagic-linux.googlecode.com/files/${pkgname}_$pkgver.tar.gz)
md5sums=('7e8942256b09f2c741658d567d62c202')

build() {
  cd "$srcdir"/${pkgname}_$pkgver

  make
}

package() {
  cd "$srcdir"/${pkgname}_$pkgver

  make PREFIX="$pkgdir"/usr/ install
}
