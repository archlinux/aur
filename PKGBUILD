# Maintainer: jsteel <mail at jsteel dot org>

pkgname=somagic-easycap-tools
pkgver=1.1
pkgrel=2
pkgdesc="Tool to extract the firmware for the Somagic EasyCAP DC60 and EasyCAP002 (original CD needed)"
url="http://code.google.com/p/easycap-somagic-linux"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('libgcrypt')
install=$pkgname.install
source=(https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/easycap-somagic-linux/somagic-easycap-tools_1.1.tar.gz)
md5sums=('e75476b067560e7d55d95e0a0931d70d')

build() {
  cd "$srcdir"/${pkgname}_$pkgver

  make
}

package() {
  cd "$srcdir"/${pkgname}_$pkgver

  make PREFIX="$pkgdir"/usr/ install
}
