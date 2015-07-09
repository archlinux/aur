# Maintainer: Jacob Emmert-Aronson <jacob at mlaronson dot com>
# Contributor: Tino Reichardt <milky-archlinux at mcmilk dot de>
pkgname=gkrellmoon
pkgver=0.6
pkgrel=3
pkgdesc="Moon clock plugin for gkrellm2"
url="http://gkrellmoon.sourceforge.net/"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('gtk2' 'gkrellm')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('0e30da51526d68cbce146ea2bdd9b685')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -D -m755 gkrellmoon.so \
    ${pkgdir}/usr/lib/gkrellm2/plugins/gkrellmoon.so
}
