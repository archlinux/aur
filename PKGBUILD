# Maintainer: David Runge <dave@sleepmap.de>
pkgname=ir.lv2
pkgver=1.3.4
pkgrel=1
pkgdesc="No-latency/low-latency, realtime, high performance signal convolver for reverb effects"
arch=('x86_64')
url="https://tomszilagyi.github.io/plugins/ir.lv2/"
license=('GPL2')
groups=('lv2-plugins' 'pro-audio')
depends=('gtk2' 'libsamplerate' 'zita-convolver')
makedepends=('lv2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tomszilagyi/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('6a9c8f906a07c6ed0daa53d8dc3693d535ec4cf63f07b5fcc62ab6638c66992ff7951918b0ce2ef8c65289b19988363be49bba9bb75a20b0463fa972b07ff58c')

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
