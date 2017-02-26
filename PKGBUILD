# Maintainer: JSkier, jskier at gmail dot com jskier.com
# Created by Paul Richards (paulrichards321(at)gmail(dot)com), http://sourceforge.net/projects/resetmsmice/
pkgname=resetmsmice
pkgver=1.1.2
pkgrel=2
pkgdesc="Application to reset many MS wireless mice models to stop excessive wheel scrolling (only needed if dual booting with Windows)"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/resetmsmice/"
license=('GPL')
depends=('libusb')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr \
  make 
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  mv "${pkgdir}/usr/sbin/resetmsmice-enable-boot" "${pkgdir}/usr/bin"
  rm -r "${pkgdir}/usr/sbin"
}

sha512sums=('f4c206ae21741f51123a56eea1f95c6a017f3be4f1bbc360959bb48e4549f0fcf88dda76b4a70816e825f2f9c5425ab12c5779b80b62fc3e0cc32e1bb868251e')
