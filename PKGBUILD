# Maintainer: Fabian Maurer <dark.shadow4@web.de>

pkgname=sdfs
pkgver=3.2.1
pkgrel=1
pkgdesc="Deduplication file system from Opendedup"
arch=('x86_64')
url="http://opendedup.org"
license=('GPL2')
depends=('libxml2' 'java-runtime' 'fuse')
source=('https://github.com/opendedup/sdfs/archive/3.2.1.zip')
md5sums=('33099d698ada4ade03a33df5dcf33d58')

prepare() {
  cd "${srcdir}/$pkgname-$pkgver/install-packages/deb"
  
  ln -s /usr/lib/jvm/default-runtime usr/share/sdfs/bin/jre
}

package() {
  cd "${srcdir}/$pkgname-$pkgver/install-packages/deb"
  
  cp -dr --no-preserve=ownership etc "${pkgdir}"
  cp -dr --no-preserve=ownership usr "${pkgdir}"
  
  install -d "${pkgdir}/usr/bin/"
  cp -dr --no-preserve=ownership sbin/* "${pkgdir}/usr/bin"
}
