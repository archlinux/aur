# Maintainer: Florian Schweikert <kelvan@logic.at>
pkgname=video_entropyd
pkgver=2.0
pkgrel=1
pkgdesc="A daemon using a webcam as entropy source"
arch=('i686' 'x86_64')
url="http://www.vanheusden.com/ved/"
license=('GPL')
depends=(glibc)
changelog=CHANGELOG
source=(http://www.vanheusden.com/ved/$pkgname-$pkgver.tgz)
md5sums=('dab5bb2687bc43ed7e51962de904fd4e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -D -m644 license.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -D -m755 video_entropyd ${pkgdir}/usr/bin/video_entropyd
}
