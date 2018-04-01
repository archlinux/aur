# Maintainer: David Runge <dave@sleepmap.de>
pkgname=ir.lv2
pkgver=1.3.3
pkgrel=1
pkgdesc="A no-latency/low-latency, realtime, high performance signal convolver especially for creating reverb effects"
arch=('x86_64')
url="https://tomszilagyi.github.io/plugins/ir.lv2/"
license=('GPL2')
groups=('lv2-plugins' 'pro-audio')
depends=('gtk2' 'libsamplerate' 'libsndfile' 'zita-convolver')
makedepends=('lv2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tomszilagyi/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('9ed7dd7fb0099cb71ef259345dcff4007bf28fd2e19c29b5566816cf7f53426d8956d342610d92a3e031a53017a5224add28719c298c107630ccde3392ddfb06')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -vDm 644 {ChangeLog,README.md} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
