# Maintainer: Jacob Emmert-Aronson <jacob at mlaronson dot com>
# Contributor: Tino Reichardt <milky-archlinux at mcmilk dot de>
pkgname=gkrellshoot
pkgver=0.4.4
pkgrel=2
pkgdesc="A plugin for GkrellM for screen lock and screen shoot"
arch=('i686' 'x86_64')
license=('GPL')
depends=('imagemagick' 'gkrellm' 'gtk2')
source=("http://downloads.sourceforge.net/project/$pkgname/GkrellM2.0%20Port/$pkgver/$pkgname-$pkgver.tar.gz")
url="http://gkrellshoot.sourceforge.net/"
md5sums=('aa5d16c2a284e018dbab532bec44a0d6')

build() {
  cd ${srcdir}/gkrellShoot-${pkgver}
  make
}

package() {
  cd ${srcdir}/gkrellShoot-${pkgver}
  install -D -m755 gkrellshoot.so \
    ${pkgdir}/usr/lib/gkrellm2/plugins/gkrellshoot.so
}
