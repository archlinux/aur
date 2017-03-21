# Maintainer: lesto 

pkgname=somagic-easycap
pkgver=1.1
pkgrel=1
pkgdesc="Linux Somagic EasyCAP DC60 and EasyCAP002 capture software"
url="http://code.google.com/p/easycap-somagic-linux"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('libusbx' 'libgcrypt')
optdepends=('somagic-easycap-tools: to extract the firmware')
source=(https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/easycap-somagic-linux/${pkgname}_$pkgver.tar.gz)
md5sums=('7e8942256b09f2c741658d567d62c202')
sha256sum=('3a9dd78a47335a6d041cd5465d28124612dad97939c56d7c10e000484d78a320')
build() {
  cd "$srcdir"/${pkgname}_$pkgver

  make
}

package() {
  cd "$srcdir"/${pkgname}_$pkgver

  make PREFIX="$pkgdir"/usr/ install
}
