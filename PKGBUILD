# Maintainer: David Runge <dave@sleepmap.de>
pkgname=gmsynth.lv2
pkgver=0.3.0
pkgrel=1
pkgdesc="General MIDI LV2 Synth"
arch=('x86_64')
url="https://x42-plugins.com/x42/x42-gmsynth"
license=('GPL2')
groups=('pro-audio' 'lv2-plugins')
depends=('lv2' 'glib2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/x42/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('30c2ccf47dd7f92cbc983328729f9c8caec7624617eb86a31f5f7bdd722cf1b8a95917ceb810e65bbe2f6a432bc60a7c342d33244480239ab259be14b3204a7a')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" PREFIX='/usr' install
  install -vDm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
